// model
import '../../domain/entities/mentor.dart';

class MentorsModel extends Mentor {
  MentorsModel({
    required super.id,
    required super.fullName,
    required super.email,
    required super.avatarUrl,
    required super.bio,
    required super.expertise,
    required super.expertiseDisplay,
    required super.rating,
    required super.isTopMentor,
    required super.yearsExperience,
    required super.createdAt,
  });

  factory MentorsModel.fromJson(Map<String, dynamic> json) {
    return MentorsModel(
      id: json['id'],
      fullName: json['full_name'] ?? 'Unknown',
      email: json['email'] ?? 'No Email',
      avatarUrl: json['avatar_url'] ?? 'assets/images/default_avatar.png',
      bio: json['bio'] ?? 'No Bio Available',
      expertise: json['expertise'] ?? 'No expertise listed',
      expertiseDisplay: json['expertise_display'] ?? 'No display',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      isTopMentor: json['is_top_mentor'] ?? false,
      yearsExperience: json['years_experience'] ?? 0,
      createdAt:
          json['created_at'] != null
              ? DateTime.parse(json['created_at'])
              : DateTime.now(),
    );
  }
}
