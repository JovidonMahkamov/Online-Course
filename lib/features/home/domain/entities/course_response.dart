import 'courses.dart';

class CourseResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<Course> results;

  CourseResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });
}
