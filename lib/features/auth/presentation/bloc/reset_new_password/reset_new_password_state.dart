abstract class ResetNewPasswordState {
  const ResetNewPasswordState();
}

class ResetNewPasswordInitial extends ResetNewPasswordState {}

class ResetNewPasswordLoading extends ResetNewPasswordState {}

class ResetNewPasswordSuccess extends ResetNewPasswordState {}

class ResetNewPasswordError extends ResetNewPasswordState {
  final String message;

  const ResetNewPasswordError({required this.message});
}