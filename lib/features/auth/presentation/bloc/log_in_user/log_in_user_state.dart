
import 'package:portfolio1/features/auth/domain/entities/token_entity.dart';

abstract class LogInUserState {
  const LogInUserState();
}

class LogInUserInitial extends LogInUserState {}

class LogInUserLoading extends LogInUserState {}

class LogInUserSuccess extends LogInUserState {
  final TokenEntity user;

  const LogInUserSuccess({required this.user});
}

class LogInUserError extends LogInUserState {
  final String message;

  const LogInUserError({required this.message});
}