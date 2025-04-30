import 'package:hive_flutter/hive_flutter.dart';

abstract class AuthLocalDataSource {
  Future<void> saveRememberMe(String email, String password);

  Future<Map<String, String>> getRemembered();

  Future<void> clearRememberedCredentials();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final Box box;

  AuthLocalDataSourceImpl(this.box);

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
}