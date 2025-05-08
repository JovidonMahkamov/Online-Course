
import 'lessons.dart';

class LessonsResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<Lesson> lessons;

  LessonsResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.lessons,
  });
}
