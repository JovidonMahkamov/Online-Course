import '../../domain/entities/search_response.dart';
import 'course_model.dart';
import 'mentor_model.dart';

class SearchResponseModel extends SearchResponse {
  SearchResponseModel({required super.courses, required super.mentors});

  factory SearchResponseModel.fromJson(Map<String, dynamic> json) {
    return SearchResponseModel(
      courses: (json['courses'] as List<dynamic>?)
              ?.map((e) => CourseModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      mentors: (json['mentors'] as List<dynamic>?)
              ?.map((e) => MentorsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}
