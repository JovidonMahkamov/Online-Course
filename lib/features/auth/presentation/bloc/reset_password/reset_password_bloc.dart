
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio1/features/auth/presentation/bloc/reset_password/reset_password_state.dart';

import '../../../domain/usecase/reset_password.dart';
import '../auth_event.dart';
class ResetPasswordBloc extends Bloc<AuthEvent, ResetPasswordState> {
  final ResetPasswordUseCase resetPasswordUseCase;

  ResetPasswordBloc(this.resetPasswordUseCase) : super(ResetPasswordInitial()) {
    on<ResetPasswordEvent>(onResetPasswordEvent);
  }

  Future<void> onResetPasswordEvent(event, emit) async {
    emit(ResetPasswordLoading());
    try {
      final result = await resetPasswordUseCase(
        emailOrPhone: event.emailOrPhone,
      );
      emit(ResetPasswordSuccess(response: result));
    } catch (e) {
      emit(ResetPasswordError(message: e.toString()));
    }
  }
}
