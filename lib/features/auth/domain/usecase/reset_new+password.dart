
import '../repository/auth_repository.dart';

class ResetNewPasswordUseCase {
  final AuthRepo authRepository;

  ResetNewPasswordUseCase(this.authRepository);

  Future<void> call({required String newPassword,required String token}) async {
    return await authRepository.createNewPassword(
      newPassword: newPassword,
      token: token,
    );
  }
}