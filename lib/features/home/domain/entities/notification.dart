class Notification {
  final int id;
  final String title;
  final String message;
  final String notificationType;
  final bool isRead;
  final DateTime createdAt;
  final String timeSince;

  Notification({
    required this.id,
    required this.title,
    required this.message,
    required this.notificationType,
    required this.isRead,
    required this.createdAt,
    required this.timeSince,
  });
}
