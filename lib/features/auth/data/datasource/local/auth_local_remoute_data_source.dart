import 'package:hive_flutter/adapters.dart';

import 'auth_local_data_cource.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final Box box;

  AuthLocalDataSourceImpl(this.box);

  //! Remember me
  @override
  Future<void> saveRememberMe(String email, String password) async {
    await box.put('email', email);
    await box.put('password', password);
  }

  @override
  Future<Map<String, String>> getRemembered() async {
    final email = box.get('email', defaultValue: '');
    final password = box.get('password', defaultValue: '');
    return {'email': email, 'password': password};
  }

  @override
  Future<void> clearRememberedCredentials() async {
    await box.delete('email');
    await box.delete('password');
  }

  //! Auth token
  @override
  Future<void> clearAuthToken() async {
    await box.delete('auth_token');
    await box.delete('refresh_token');
  }

  @override
  Future<Map<String, String>> getAuthToken() async {
    final accessToken = box.get('auth_token', defaultValue: '');
    final refreshToken = box.get('refresh_token', defaultValue: '');

    if (accessToken == '' || refreshToken == '') {
      return {};
    }
    return {'access_token': accessToken, 'refresh_token': refreshToken};
  }

  @override
  Future<void> saveAuthToken(String refreshToken, String accessToken) async {
    await box.put('auth_token', accessToken);
    await box.put('refresh_token', refreshToken);
  }
}
