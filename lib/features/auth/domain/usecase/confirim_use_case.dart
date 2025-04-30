
import 'package:portfolio1/features/auth/domain/entities/token_entity.dart';
import 'package:portfolio1/features/auth/domain/repository/auth_repository.dart';

class ConfirmUseCase {
  final AuthRepo authRepository;

  ConfirmUseCase(this.authRepository);

  Future<TokenEntity> call({
    required int userId,
    required int code,
    required bool isResendPassword,
  }) async {
    return await authRepository.confirmEmail(
      userId: userId,
      code: code,
      isResetPassword: isResendPassword,
    );
  }
}