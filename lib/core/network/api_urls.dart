abstract class ApiUrls {
  static const String baseUrl = 'https://manuchehra.pythonanywhere.com/api/';
  // static const String baseUrl = 'http://13.40.123.211:8000/api/';

  //! Auth
  static const String auth = 'auth/';
  static const String register = '${auth}register/';
  static const String login = '${auth}login/';
  static const String confirmEmail = '${auth}confirm-email/';
  static const String resetPassword = '${auth}reset-password/';
  static const String resetPasswordConfirm =
      '${auth}reset-password/confirm-code/';
  static const String resetNewPassword =
      '${auth}reset-password/confirm-password/';

  //! Courses
  static const String courses = 'courses/?limit=';
}
