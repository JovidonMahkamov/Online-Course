
import '../../models/register_model.dart';
import '../../models/reset_password_model.dart';
import '../../models/token_model.dart';

abstract class AuthRemoteDataSource {
  Future<RegisterModel> registerUser({
    required String email,
    required String password,
  });

  Future<TokenModel> confirmEmail({
    required int userId,
    required int code,
    required bool isResetPassword,
  });

  Future<TokenModel> loginUser({
    required String email,
    required String password,
  });

  Future<ResetPasswordModel> resetPassword({required String emailOrPhone});


  Future<void> createNewPassword({
    required String newPassword,
    required String token,
  });
}
