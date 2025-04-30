import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecase/reset_new+password.dart';
import '../auth_event.dart';
import 'reset_new_password_state.dart';

class ResetNewPasswordBloc extends Bloc<AuthEvent, ResetNewPasswordState> {
  final ResetNewPasswordUseCase resetNewPasswordUseCase;

  ResetNewPasswordBloc(this.resetNewPasswordUseCase)
      : super(ResetNewPasswordInitial()) {
    on<ResetNewPasswordEvent>((event, emit) async {
      emit(ResetNewPasswordLoading());
      try {
        await resetNewPasswordUseCase(
          newPassword: event.newPassword,
          token: event.token,
        );
        emit(ResetNewPasswordSuccess());
      } catch (e) {
        emit(ResetNewPasswordError(message: e.toString()));
      }
    });
  }
}