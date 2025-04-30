
import 'package:portfolio1/features/auth/domain/entities/register_entity.dart';
import 'package:portfolio1/features/auth/domain/entities/reset_password.dart';
import 'package:portfolio1/features/auth/domain/entities/token_entity.dart';

abstract class AuthRepo {
  Future<RegisterEntity> registerUser({
    required String email,
    required String password,
  });

  Future<TokenEntity> confirmEmail({
    required int userId,
    required int code,
    required bool isResetPassword,
  });

  Future<TokenEntity> loginUser({
    required String email,
    required String password,
  });

  Future<ResetPassword> resetPassword({required String emailOrPhone});

  Future<void> createNewPassword({
    required String newPassword,
    required String token,
  });
// Future<UserAccount> fillProfile({
//   required String image,
//   required String fullName,
//   required String userName,
//   required String email,
//   required String phone,
//   required String address,
// });
}