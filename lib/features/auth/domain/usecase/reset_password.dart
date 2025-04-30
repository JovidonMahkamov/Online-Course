
import '../entities/reset_password.dart';
import '../repository/auth_repository.dart';

class ResetPasswordUseCase {
  final AuthRepo authRepository;

  ResetPasswordUseCase(this.authRepository);

  Future<ResetPassword> call({required String emailOrPhone}) async {
    return await authRepository.resetPassword(emailOrPhone: emailOrPhone);
  }
}