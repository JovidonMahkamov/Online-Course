
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/services.dart';
import 'features/auth/presentation/bloc/confirm_email/confirm_email_bloc.dart';
import 'features/auth/presentation/bloc/log_in_user/log_in_user_bloc.dart';
import 'features/auth/presentation/bloc/register_user/sign_up_in_bloc.dart';
import 'features/auth/presentation/bloc/reset_new_password/resset_new_password_bloc.dart';
import 'features/auth/presentation/bloc/reset_password/reset_password_bloc.dart';

class MyBlocProvider extends StatelessWidget {
  const MyBlocProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //* Auth
        BlocProvider<RegisterUserBloc>(
          create: (context) => sl<RegisterUserBloc>(),
        ),
        BlocProvider<ConfirmEmailBloc>(
          create: (context) => sl<ConfirmEmailBloc>(),
        ),
        BlocProvider<LogInUserBloc>(create: (context) => sl<LogInUserBloc>()),
        BlocProvider<ResetPasswordBloc>(
          create: (context) => sl<ResetPasswordBloc>(),
        ),
        BlocProvider<ResetNewPasswordBloc>(
          create: (context) => sl<ResetNewPasswordBloc>(),
        ),
        // * Home
        // BlocProvider<CourseBloc>(create: (context) => sl<CourseBloc>()),
      ],
      child: child,
    );
  }
}
