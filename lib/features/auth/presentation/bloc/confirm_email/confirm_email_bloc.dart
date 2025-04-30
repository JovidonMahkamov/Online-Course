import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/confirim_use_case.dart';
import '../auth_event.dart';
import 'confirm_email_state.dart';

class ConfirmEmailBloc extends Bloc<AuthEvent, ConfirmEmailState> {
  final ConfirmUseCase confirmEmail;

  ConfirmEmailBloc(this.confirmEmail) : super(ConfirmEmailInitial()) {
    on<ConfirmEmail>((event, emit) async {
      emit(ConfirmEmailLoading());
      try {
        final result = await confirmEmail(
          userId: event.userId,
          code: event.code,
          isResendPassword: event.isResetPassword,
        );
        emit(ConfirmEmailSuccess(token: result));
      } catch (e) {
        emit(ConfirmEmailFailure(error: e.toString()));
      }
    });
  }
}