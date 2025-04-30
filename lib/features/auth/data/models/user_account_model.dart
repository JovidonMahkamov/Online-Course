import '../../domain/entities/user_account.dart';

class UserAccountModel extends UserAccount {
  UserAccountModel({
    required super.id,
    required super.password,
    required super.lastLogin,
    required super.isSuperuser,
    required super.isStaff,
    required super.isActive,
    required super.dateJoined,
    required super.username,
    required super.phoneNumber,
    required super.email,
    required super.fullName,
    required super.authType,
    required super.authRole,
    required super.authStatus,
    required super.image,
    required super.banner,
    required super.bio,
    required super.wallet,
    required super.emailConfirmed,
    required super.country,
    required super.specialization,
    required super.groups,
    required super.userPermissions,
    required super.workingHours,
  });

  factory UserAccountModel.fromJson(Map<String, dynamic> json) {
    return UserAccountModel(
      id: json['id'],
      password: json['password'],
      lastLogin:
      json['last_login'] != null
          ? DateTime.parse(json['last_login'])
          : null,
      isSuperuser: json['is_superuser'],
      isStaff: json['is_staff'],
      isActive: json['is_active'],
      dateJoined: DateTime.parse(json['date_joined']),
      username: json['username'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      fullName: json['full_name'],
      authType: json['auth_type'],
      authRole: json['auth_role'],
      authStatus: json['auth_status'],
      image: json['image'],
      banner: json['banner'],
      bio: json['bio'],
      wallet: json['wallet'],
      emailConfirmed: json['email_confirmed'],
      country: json['country'],
      specialization: json['specialization'],
      groups: List<int>.from(json['groups'] ?? []),
      userPermissions: List<int>.from(json['user_permissions'] ?? []),
      workingHours: List<int>.from(json['working_hours'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'password': password,
      'last_login': lastLogin?.toIso8601String(),
      'is_superuser': isSuperuser,
      'is_staff': isStaff,
      'is_active': isActive,
      'date_joined': dateJoined.toIso8601String(),
      'username': username,
      'phone_number': phoneNumber,
      'email': email,
      'full_name': fullName,
      'auth_type': authType,
      'auth_role': authRole,
      'auth_status': authStatus,
      'image': image,
      'banner': banner,
      'bio': bio,
      'wallet': wallet,
      'email_confirmed': emailConfirmed,
      'country': country,
      'specialization': specialization,
      'groups': groups,
      'user_permissions': userPermissions,
      'working_hours': workingHours,
    };
  }
}