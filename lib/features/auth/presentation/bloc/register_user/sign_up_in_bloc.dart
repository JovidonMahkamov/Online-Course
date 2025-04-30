import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio1/features/auth/presentation/bloc/register_user/sign_up_in_state.dart';

import '../../../domain/usecase/register_email_usecase.dart';
import '../auth_event.dart';

class RegisterUserBloc extends Bloc<AuthEvent, RegisterUserState> {
  final RegisterUserUseCase registerUserUseCase;

  RegisterUserBloc(this.registerUserUseCase) : super(RegisterUserInitial()) {
    on<RegisterUser>((event, emit) async {
      emit(RegisterUserLoading());
      try {
        final result = await registerUserUseCase(
          email: event.email,
          password: event.password,
        );
        emit(RegisterUserSuccess(registerEntity: result));
      } catch (e) {
        emit(RegisterUserError(error: e.toString()));
      }
    });
  }
}