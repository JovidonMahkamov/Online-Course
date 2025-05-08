
import '../../domain/entities/response_mentor.dart';
import 'mentor_model.dart';

class MentorsResponseModel extends ResponseMentor {
  MentorsResponseModel({
    required super.count,
    required super.next,
    required super.previous,
    required super.results,
  });

  factory MentorsResponseModel.fromJson(Map<String, dynamic> json) {
    return MentorsResponseModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results:
          (json['results'] as List)
              .map((mentor) => MentorsModel.fromJson(mentor))
              .toList(),
    );
  }
}
