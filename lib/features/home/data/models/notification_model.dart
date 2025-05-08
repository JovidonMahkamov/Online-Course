
import '../../domain/entities/notification.dart';

class NotificationModel extends Notification {
  NotificationModel({
    required super.id,
    required super.title,
    required super.message,
    required super.notificationType,
    required super.isRead,
    required super.createdAt,
    required super.timeSince,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      title: json['title'],
      message: json['message'],
      notificationType: json['notification_type'],
      isRead: json['is_read'],
      createdAt: DateTime.parse(json['created_at']),
      timeSince: json['time_since'],
    );
  }
}
