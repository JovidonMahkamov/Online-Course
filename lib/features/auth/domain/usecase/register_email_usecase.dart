

import 'package:portfolio1/features/auth/domain/entities/register_entity.dart';

import '../repository/auth_repository.dart';

class RegisterUserUseCase {
  final AuthRepo authRepository;

  RegisterUserUseCase(this.authRepository);

  Future<RegisterEntity> call({
    required String email,
    required String password,
  }) async {
    return await authRepository.registerUser(email: email, password: password);
  }
}