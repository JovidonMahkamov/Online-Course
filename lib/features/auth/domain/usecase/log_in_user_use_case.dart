import 'package:portfolio1/features/auth/domain/entities/token_entity.dart';
import 'package:portfolio1/features/auth/domain/repository/auth_repository.dart';

class LogInUserUseCase {
  final AuthRepo authRepository;

  LogInUserUseCase(this.authRepository);

  Future<TokenEntity> call({required String email,required String password}) async {
    return await authRepository.loginUser(email: email, password: password);
  }
}