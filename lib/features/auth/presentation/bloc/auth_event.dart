abstract class AuthEvent {
  const AuthEvent();
}

class RegisterUser extends AuthEvent {
  final String email;
  final String password;

  const RegisterUser({required this.email, required this.password});
}

class ConfirmEmail extends AuthEvent {
  final int userId;
  final int code;
  final bool isResetPassword;

  const ConfirmEmail({
    required this.userId,
    required this.code,
    required this.isResetPassword,
  });
}

class LoginUser extends AuthEvent {
  final String email;
  final String password;

  const LoginUser({required this.email, required this.password});
}

class ResetPasswordEvent extends AuthEvent {
  final String emailOrPhone;

  const ResetPasswordEvent({required this.emailOrPhone});
}

class ResetNewPasswordEvent extends AuthEvent {
  final String newPassword;
  final String token;

  const ResetNewPasswordEvent({required this.newPassword, required this.token});
}