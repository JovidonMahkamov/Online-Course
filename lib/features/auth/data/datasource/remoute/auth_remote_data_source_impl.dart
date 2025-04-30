import '../../../../../core/network/api_urls.dart';
import '../../../../../core/network/dio_client.dart';
import '../../../../../core/untils/logger.dart';
import '../../models/register_model.dart';
import '../../models/reset_password_model.dart';
import '../../models/token_model.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient dioClient = DioClient();

  @override
  Future<RegisterModel> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dioClient.post(
        ApiUrls.register,
        data: {'phone_or_email': email, 'password': password},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoggerService.info('Registration successful: ${response.data}');
        return RegisterModel.fromJson(response.data);
      } else {
        LoggerService.warning("Registration failed: ${response.statusCode}");
        throw Exception('Registration failed: ${response.statusCode}');
      }
    } catch (e) {
      LoggerService.error('Error during user registration: $e');
      rethrow;
    }
  }

  @override
  Future<TokenModel> confirmEmail({
    required int userId,
    required int code,
    required bool isResetPassword,
  }) async {
    try {
      final response = await dioClient.post(
        isResetPassword ? ApiUrls.resetPasswordConfirm : ApiUrls.confirmEmail,
        data: {'user_id': userId, 'code': code},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoggerService.info('Email confirmation successful: ${response.data}');
        return TokenModel.fromJson(response.data);
      } else {
        LoggerService.warning(
          "Email confirmation failed: ${response.statusCode}",
        );
        throw Exception('Email confirmation failed: ${response.statusCode}');
      }
    } catch (e) {
      LoggerService.error('Error during email confirmation: $e');
      rethrow;
    }
  }

  @override
  Future<TokenModel> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dioClient.post(
        ApiUrls.login,
        data: {'email': email, 'password': password},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoggerService.info('Login successful: ${response.data}');
        return TokenModel.fromJson(response.data);
      } else {
        LoggerService.warning("Login failed: ${response.statusCode}");
        throw Exception('Login failed: ${response.statusCode}');
      }
    } catch (e) {
      LoggerService.error('Error during user login: $e');
      rethrow;
    }
  }

  @override
  Future<ResetPasswordModel> resetPassword({
    required String emailOrPhone,
  }) async {
    try {
      final response = await dioClient.post(
        ApiUrls.resetPassword,
        data: {'phone_or_email': emailOrPhone},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoggerService.info('Password reset successful: ${response.data}');
        return ResetPasswordModel.fromJson(response.data);
      } else {
        LoggerService.warning("Password reset failed: ${response.statusCode}");
        throw Exception('Password reset failed: ${response.statusCode}');
      }
    } catch (e) {
      LoggerService.error('Error during password reset: $e');
      rethrow;
    }
  }

  @override
  Future<void> createNewPassword({
    required String newPassword,
    required String token,
  }) async {
    try {
      dioClient.setToken(token);
      final response = await dioClient.post(
        ApiUrls.resetNewPassword,
        data: {'password_one': newPassword},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoggerService.info('New password created successfully');
      } else {
        LoggerService.warning(
          "Failed to create new password: ${response.statusCode}",
        );
        throw Exception(
          'Failed to create new password: ${response.statusCode}',
        );
      }
    } catch (e) {
      LoggerService.error('Error during new password creation: $e');
      rethrow;
    }
  }
}