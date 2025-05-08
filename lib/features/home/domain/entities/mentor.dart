// entity
class Mentor {
  final int id;
  final String fullName;
  final String email;
  final String? avatarUrl; // <-- nullable
  final String? bio;       // <-- nullable
  final String expertise;
  final String expertiseDisplay;
  final double rating;
  final bool isTopMentor;
  final int yearsExperience;
  final DateTime createdAt;

  Mentor({
    required this.id,
    required this.fullName,
    required this.email,
    this.avatarUrl, // <-- nullable
    this.bio,       // <-- nullable
    required this.expertise,
    required this.expertiseDisplay,
    required this.rating,
    required this.isTopMentor,
    required this.yearsExperience,
    required this.createdAt,
  });
}
