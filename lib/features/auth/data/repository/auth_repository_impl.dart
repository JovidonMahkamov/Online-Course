

import 'package:portfolio1/features/auth/domain/entities/token_entity.dart';

import '../../domain/entities/reset_password.dart';
import '../../domain/repository/auth_repository.dart';
import '../datasource/remoute/auth_remote_data_source.dart';
import '../models/register_model.dart';

class AuthRepositoryImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<RegisterModel> registerUser({
    required String email,
    required String password,
  }) async {
    return authRemoteDataSource.registerUser(email: email, password: password);
  }

  @override
  Future<TokenEntity> confirmEmail({
    required int userId,
    required int code,
    required bool isResetPassword,
  }) {
    return authRemoteDataSource.confirmEmail(
      userId: userId,
      code: code,
      isResetPassword: isResetPassword,
    );
  }

  @override
  Future<TokenEntity> loginUser({
    required String email,
    required String password,
  }) {
    return authRemoteDataSource.loginUser(email: email, password: password);
  }

  @override
  Future<ResetPassword> resetPassword({required String emailOrPhone}) {
    return authRemoteDataSource.resetPassword(emailOrPhone: emailOrPhone);
  }

  @override
  Future<void> createNewPassword({
    required String newPassword,
    required String token,
  }) {
    return authRemoteDataSource.createNewPassword(
      newPassword: newPassword,
      token: token,
    );
  }
}