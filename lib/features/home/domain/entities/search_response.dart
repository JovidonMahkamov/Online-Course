
import 'courses.dart';
import 'mentor.dart';

class SearchResponse {
  final List<Course> courses;
  final List<Mentor> mentors;

  SearchResponse({required this.courses, required this.mentors});
}
