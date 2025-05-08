import 'notification.dart';

class NotificationResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<Notification> results;

  NotificationResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });


}

