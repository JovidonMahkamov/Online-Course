import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import '../../features/auth/data/datasource/local/auth_local_data_cource.dart';
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
import '../../features/home/data/data_sources/home_remote_data_source.dart';
import '../../features/home/data/data_sources/home_remote_data_source_impl.dart';
import '../../features/home/data/repositories/home_repository.dart';
import '../../features/home/domain/repositories/home_repo.dart';
import '../../features/home/domain/use_cases/add_to_wishlist_use_case.dart';
import '../../features/home/domain/use_cases/category_use_case.dart';
import '../../features/home/domain/use_cases/courses_use_case.dart';
import '../../features/home/domain/use_cases/mentors_use_case.dart';
import '../../features/home/domain/use_cases/notification_use_case.dart';
import '../../features/home/domain/use_cases/remove_from_wishlist_use_case.dart';
import '../../features/home/domain/use_cases/search_use_case.dart';
import '../../features/home/domain/use_cases/single_course_use_case.dart';
import '../../features/home/domain/use_cases/top_mentors_use_case.dart';
import '../../features/home/domain/use_cases/wishlist_use_case.dart';
import '../../features/home/presentation/bloc/add_to_wishlist/add_to_wishlist__bloc.dart';
import '../../features/home/presentation/bloc/category/category_bloc.dart';
import '../../features/home/presentation/bloc/courses/courses_bloc.dart';
import '../../features/home/presentation/bloc/mentors/mentors_bloc.dart';
import '../../features/home/presentation/bloc/notification/notification_bloc.dart';
import '../../features/home/presentation/bloc/remove_from_wishlist/remove_from_wishlist_bloc.dart';
import '../../features/home/presentation/bloc/search/search_bloc.dart';
import '../../features/home/presentation/bloc/single_course/single_course_bloc.dart';
import '../../features/home/presentation/bloc/top_mentors/top_mentors_bloc.dart';
import '../../features/home/presentation/bloc/wishlist/wishlist_bloc.dart';
import 'package:get_storage/get_storage.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  sl.registerLazySingleton(() => Dio());
  await Hive.initFlutter();
  await GetStorage.init();
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
  sl.registerLazySingleton<HomeRemoteDataSource>(
        () => HomeRemoteDataSourceImpl(),
  );

  //! Repositories
  // * Auth
  sl.registerLazySingleton<AuthRepo>(
        () => AuthRepositoryImpl(authRemoteDataSource: sl()),
  );

  // * Home
  sl.registerLazySingleton<HomeRepo>(
        () => HomeRepositoryImpl(homeRemoteDataSource: sl()),
  );
  //! Use cases
  // * Auth
  sl.registerLazySingleton(() => RegisterUserUseCase(sl()));
  sl.registerLazySingleton(() => ConfirmUseCase(sl()));
  sl.registerLazySingleton(() => LogInUserUseCase(sl()));
  sl.registerLazySingleton(() => ResetPasswordUseCase(sl()));
  sl.registerLazySingleton(() => ResetNewPasswordUseCase(sl()));
  // sl.registerLazySingleton(() => LogOutUseCase(sl()));

  // * Home
  sl.registerLazySingleton(() => CoursesUseCase(sl()));
  sl.registerLazySingleton(() => SingleCourseUseCase(sl()));
  sl.registerLazySingleton(() => TopMentorsUseCase(sl()));
  sl.registerLazySingleton(() => MentorsUseCase(sl()));
  sl.registerLazySingleton(() => CategoryUseCase(sl()));
  sl.registerLazySingleton(() => WishlistUseCase(sl()));
  sl.registerLazySingleton(() => SearchUseCase(sl()));
  sl.registerLazySingleton(() => AddToWishlistUseCase(sl()));
  sl.registerLazySingleton(() => NotificationUseCase(sl()));
  sl.registerLazySingleton(() => RemoveFromWishlistUseCase(sl()));

  //! Bloc
  // * Auth
  sl.registerLazySingleton(() => RegisterUserBloc(sl()));
  sl.registerLazySingleton(() => ConfirmEmailBloc(sl()));
  sl.registerLazySingleton(() => LogInUserBloc(sl()));
  sl.registerLazySingleton(() => ResetPasswordBloc(sl()));
  sl.registerLazySingleton(() => ResetNewPasswordBloc(sl()));
  // * Home
  sl.registerLazySingleton(() => CourseBloc(sl()));
  sl.registerLazySingleton(() => SingleCourseBloc(sl()));
  sl.registerLazySingleton(() => TopMentorsBloc(sl()));
  sl.registerLazySingleton(() => MentorBloc(sl()));
  sl.registerLazySingleton(() => CategoryBloc(sl()));
  sl.registerLazySingleton(() => WishlistBloc(sl()));
  sl.registerLazySingleton(() => SearchBloc(sl()));
  sl.registerLazySingleton(() => AddWishlistBloc(sl()));
  sl.registerLazySingleton(() => NotificationBloc(sl()));
  sl.registerLazySingleton(() => RemoveFromWishlistBloc(sl()));
}
