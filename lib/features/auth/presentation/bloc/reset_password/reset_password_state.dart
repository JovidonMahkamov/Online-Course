
import '../../../domain/entities/reset_password.dart';

abstract class ResetPasswordState {
  const ResetPasswordState();
}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {
  final ResetPassword response;

  const ResetPasswordSuccess({required this.response});
}

class ResetPasswordError extends ResetPasswordState {
  final String message;

  const ResetPasswordError({required this.message});
}