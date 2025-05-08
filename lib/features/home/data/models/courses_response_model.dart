
import '../../domain/entities/course_response.dart';
import 'course_model.dart';

class CoursesResponseModel extends CourseResponse {
  CoursesResponseModel({
    required super.count,
    required super.results,
    required super.next,
    required super.previous,
  });

  factory CoursesResponseModel.fromJson(Map<String, dynamic> json) {
    return CoursesResponseModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results:
          (json['results'] as List)
              .map((e) => CourseModel.fromJson(e))
              .toList(),
    );
  }
}
