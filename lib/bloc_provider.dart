
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/services.dart';
import 'features/auth/presentation/bloc/confirm_email/confirm_email_bloc.dart';
import 'features/auth/presentation/bloc/log_in_user/log_in_user_bloc.dart';
import 'features/auth/presentation/bloc/register_user/sign_up_in_bloc.dart';
import 'features/auth/presentation/bloc/reset_new_password/resset_new_password_bloc.dart';
import 'features/auth/presentation/bloc/reset_password/reset_password_bloc.dart';
import 'features/home/presentation/bloc/add_to_wishlist/add_to_wishlist__bloc.dart';
import 'features/home/presentation/bloc/category/category_bloc.dart';
import 'features/home/presentation/bloc/courses/courses_bloc.dart';
import 'features/home/presentation/bloc/mentors/mentors_bloc.dart';
import 'features/home/presentation/bloc/notification/notification_bloc.dart';
import 'features/home/presentation/bloc/remove_from_wishlist/remove_from_wishlist_bloc.dart';
import 'features/home/presentation/bloc/search/search_bloc.dart';
import 'features/home/presentation/bloc/single_course/single_course_bloc.dart';
import 'features/home/presentation/bloc/top_mentors/top_mentors_bloc.dart';
import 'features/home/presentation/bloc/wishlist/wishlist_bloc.dart';

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
        // BlocProvider<LogoutUserBloc>(create: (context) => sl<LogoutUserBloc>()),
        // * Home
        BlocProvider<CourseBloc>(create: (context) => sl<CourseBloc>()),
        BlocProvider<SingleCourseBloc>(
          create: (context) => sl<SingleCourseBloc>(),
        ),
        BlocProvider<TopMentorsBloc>(create: (context) => sl<TopMentorsBloc>()),
        BlocProvider<MentorBloc>(create: (context) => sl<MentorBloc>()),
        BlocProvider<CategoryBloc>(create: (context) => sl<CategoryBloc>()),
        BlocProvider<WishlistBloc>(create: (context) => sl<WishlistBloc>()),
        BlocProvider<SearchBloc>(create: (context) => sl<SearchBloc>()),
        BlocProvider<AddWishlistBloc>(
          create: (context) => sl<AddWishlistBloc>(),
        ),
        BlocProvider<NotificationBloc>(
          create: (context) => sl<NotificationBloc>(),
        ),
        BlocProvider<RemoveFromWishlistBloc>(
          create: (context) => sl<RemoveFromWishlistBloc>(),
        ),
      ],
      child: child,
    );
  }
}
