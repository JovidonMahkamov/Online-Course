import 'package:flutter/material.dart';
import 'package:portfolio1/core/route/route_names.dart';
import 'package:portfolio1/features/auth/presentation/pages/profile/profile_blank_page.dart';
import 'package:portfolio1/features/auth/presentation/pages/profile/set_fingerprint_page.dart';
import 'package:portfolio1/features/auth/presentation/pages/sign/Forgot_password_methods.dart';
import 'package:portfolio1/features/auth/presentation/pages/sign/create_new_password_page.dart';
import 'package:portfolio1/features/auth/presentation/pages/sign/forgot_password_type_otp_page.dart';
import 'package:portfolio1/features/auth/presentation/pages/sign/sign_in_page.dart';
import 'package:portfolio1/features/auth/presentation/pages/sign/sign_up_page.dart';
import 'package:portfolio1/features/home/presentation/pages/home/home_my_bookmark_page.dart';
import 'package:portfolio1/features/home/presentation/pages/home/home_notification_page.dart';
import 'package:portfolio1/features/home/presentation/pages/home/home_page.dart';
import 'package:portfolio1/features/home/presentation/pages/home/home_search_type_keyword_page.dart';
import 'package:portfolio1/features/home/presentation/pages/home/most_popular_courses_page.dart';
import 'package:portfolio1/features/home/presentation/pages/home/top_%20mentors_page.dart';
import 'package:portfolio1/features/home/presentation/pages/profil/add_new_card_page.dart';
import 'package:portfolio1/features/home/presentation/pages/profil/setting_edit_profile.dart';
import 'package:portfolio1/features/home/presentation/pages/profil/setting_language_page.dart';
import 'package:portfolio1/features/home/presentation/pages/profil/setting_notification_page.dart';
import 'package:portfolio1/features/home/presentation/pages/profil/setting_payment_page.dart';
import 'package:portfolio1/features/home/presentation/pages/profil/setting_security_page.dart';

import '../../features/auth/presentation/pages/into/home_carousel_page.dart';
import '../../features/auth/presentation/pages/into/splash_page.dart';
import '../../features/auth/presentation/pages/profile/create_new_pin_page.dart';
import '../../features/auth/presentation/pages/sign/lets_in_page.dart';
import '../../features/home/presentation/pages/home/bottom_nav_bar.dart';



class AppRoute {
  BuildContext context;
  AppRoute({required this.context});
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.infoPage:
        return MaterialPageRoute(builder: (_) =>  const SplashPage());
      case RouteNames.signUpPage:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case RouteNames.homeCarousel:
        return MaterialPageRoute(builder: (_) =>  HomeCarouselPage());
      case RouteNames.letsInPage:
        return MaterialPageRoute(builder: (_) =>  const LetsIn());
      case RouteNames.signInPage:
        return MaterialPageRoute(builder: (_) =>  const SignInPage());
      case RouteNames.profileBlank:
        return MaterialPageRoute(builder: (_) =>  const ProfileBlankPage());
      case RouteNames.createNewPinPage:
        final userId = routeSettings.arguments as int;
        return MaterialPageRoute(builder: (_) =>   CreateNewPinPage(userId: userId,));
      case RouteNames.setFingerprintPage:
        return MaterialPageRoute(builder: (_) =>   const SetFingerprintPage());
      case RouteNames.forgotPassword:
        return MaterialPageRoute(builder: (_) =>   const ForgotPassword());
      case RouteNames.forgotPasswordTypeOtpPage:
        final userId = routeSettings.arguments as int;
        final emailOrPhone = routeSettings.arguments as String;
        return MaterialPageRoute(builder: (_) =>    ForgotPasswordTypeOtpPage(userId: userId, emailOrPhone: emailOrPhone,));
      case RouteNames.createNewPassword:
        return MaterialPageRoute(builder: (_) =>    const CreateNewPasswordPage());
      case RouteNames.homePage:
        return MaterialPageRoute(builder: (_) =>    const HomePage());
      case RouteNames.bottom_Navbar:
        return MaterialPageRoute(builder: (_) =>    const BottomNavBarPage());
      case RouteNames.homeNotification:
        return MaterialPageRoute(builder: (_) =>    const HomeNotificationPage());
      case RouteNames.homeMyBookmark:
        return MaterialPageRoute(builder: (_) =>    const HomeMyBookmarkPage());
      case RouteNames.topMentors:
        return MaterialPageRoute(builder: (_) =>    const TopMentorsPage());
      case RouteNames.mostPopularCourses:
        return MaterialPageRoute(builder: (_) =>    const MostPopularCoursesPage());
      case RouteNames.homeSearchPage:
        return MaterialPageRoute(builder: (_) =>    const HomeSearchTypeKeywordPage());
      case RouteNames.settingEditProfile:
        return MaterialPageRoute(builder: (_) =>    const SettingEditProfile());
      case RouteNames.settingNotification:
        return MaterialPageRoute(builder: (_) =>    const SettingNotificationPage());
      case RouteNames.settingPayment:
        return MaterialPageRoute(builder: (_) =>    const SettingPaymentPage());
      case RouteNames.addNewCard:
        return MaterialPageRoute(builder: (_) =>    const AddNewCardPage());
      case RouteNames.security:
        return MaterialPageRoute(builder: (_) =>    const SettingSecurityPage());
      case RouteNames.language:
        return MaterialPageRoute(builder: (_) =>    const SettingLanguagePage());


      default:
        return _errorRoute();
    }
  }

  Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Page not found')),
      ),
    );
  }
}
