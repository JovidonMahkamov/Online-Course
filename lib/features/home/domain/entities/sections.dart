import 'lessons.dart';

class Section {
  final int id;
  final String title;
  final int order;
  final List<Lesson> lessons;

  Section({
    required this.id,
    required this.title,
    required this.order,
    required this.lessons,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      id: json['id'],
      title: json['title'],
      order: json['order'],
      lessons: (json['lessons'] as List)
          .map((e) => Lesson.fromJson(e))
          .toList(),
    );
  }
}
