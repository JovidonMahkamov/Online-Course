
import 'mentor.dart';

class ResponseMentor {
  final int count;
  final String? next;
  final String? previous;
  final List<Mentor> results;

  ResponseMentor({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });
}
