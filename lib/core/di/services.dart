
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import '../../features/auth/data/datasource/local/auth_local_remoute_data_source.dart';
import '../../features/auth/data/datasource/remoute/auth_remote_data_source.dart';
import '../../features/auth/data/datasource/remoute/auth_remote_data_source_impl.dart';
import '../../features/auth/data/repository/auth_repository_impl.dart';
import '../../features/auth/domain/repository/auth_repository.dart';
import '../../features/auth/domain/usecase/confirim_use_case.dart';
import '../../features/auth/domain/usecase/log_in_user_use_case.dart';
import '../../features/auth/domain/usecase/register_email_usecase.dart';
import '../../features/auth/domain/usecase/reset_new+password.dart';
import '../../features/auth/domain/usecase/reset_password.dart';
import '../../features/auth/presentation/bloc/confirm_email/confirm_email_bloc.dart';
import '../../features/auth/presentation/bloc/log_in_user/log_in_user_bloc.dart';
import '../../features/auth/presentation/bloc/register_user/sign_up_in_bloc.dart';
import '../../features/auth/presentation/bloc/reset_new_password/resset_new_password_bloc.dart';
import '../../features/auth/presentation/bloc/reset_password/reset_password_bloc.dart';
final sl = GetIt.instance;

Future<void> setup() async {
  sl.registerLazySingleton(() => Dio());
  await Hive.initFlutter();

  //! Hive
  final authBox = await Hive.openBox('authBox');
  sl.registerLazySingleton<AuthLocalDataSource>(
        () => AuthLocalDataSourceImpl(authBox),
  );

  //! Data sources
  // * Auth
  sl.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(),
  );
  // * Home
  // sl.registerLazySingleton<HomeRemoteDataSource>(
  //       () => HomeRemoteDataSourceImpl(),
  // );

  //! Repositories
  // * Auth
  sl.registerLazySingleton<AuthRepo>(
        () => AuthRepositoryImpl(authRemoteDataSource: sl()),
  );

  // * Home
  // sl.registerLazySingleton<HomeRepo>(
  //       () => HomeRepositoryImpl(homeRemoteDataSource: sl()),
  // );
  //! Use cases
  // * Auth
  sl.registerLazySingleton(() => RegisterUserUseCase(sl()));
  sl.registerLazySingleton(() => ConfirmUseCase(sl()));
  sl.registerLazySingleton(() => LogInUserUseCase(sl()));
  sl.registerLazySingleton(() => ResetPasswordUseCase(sl()));
  sl.registerLazySingleton(() => ResetNewPasswordUseCase(sl()));
  // * Home
  // sl.registerLazySingleton(() => CoursesUseCase(sl()));

  //! Bloc
  // * Auth
  sl.registerLazySingleton(() => RegisterUserBloc(sl()));
  sl.registerLazySingleton(() => ConfirmEmailBloc(sl()));
  sl.registerLazySingleton(() => LogInUserBloc(sl()));
  sl.registerLazySingleton(() => ResetPasswordBloc(sl()));
  sl.registerLazySingleton(() => ResetNewPasswordBloc(sl()));
  // * Home
  // sl.registerLazySingleton(() => CourseBloc(sl()));
}
