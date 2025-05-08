class Lesson {
  final int id;
  final String title;
  final String? videoUrl;
  final String? content;
  final int order;

  Lesson({
    required this.id,
    required this.title,
    this.videoUrl,
    this.content,
    required this.order,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'],
      title: json['title'],
      videoUrl: json['video_url'],
      content: json['content'],
      order: json['order'],
    );
  }
}
