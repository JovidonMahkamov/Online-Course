class UserAccount {
  final int id;
  final String password;
  final DateTime? lastLogin;
  final bool isSuperuser;
  final bool isStaff;
  final bool isActive;
  final DateTime dateJoined;
  final String username;
  final String? phoneNumber;
  final String? email;
  final String? fullName;
  final String authType;
  final String? authRole;
  final String? authStatus;
  final String? image;
  final String? banner;
  final String? bio;
  final int? wallet;
  final bool emailConfirmed;
  final String? country;
  final String? specialization;
  final List<int> groups;
  final List<int> userPermissions;
  final List<int> workingHours;

  UserAccount({
    required this.id,
    required this.password,
    required this.lastLogin,
    required this.isSuperuser,
    required this.isStaff,
    required this.isActive,
    required this.dateJoined,
    required this.username,
    required this.phoneNumber,
    required this.email,
    required this.fullName,
    required this.authType,
    required this.authRole,
    required this.authStatus,
    required this.image,
    required this.banner,
    required this.bio,
    required this.wallet,
    required this.emailConfirmed,
    required this.country,
    required this.specialization,
    required this.groups,
    required this.userPermissions,
    required this.workingHours,
  });
}