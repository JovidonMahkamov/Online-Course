
import '../../domain/entities/notification_response.dart';
import 'notification_model.dart';

class NotificationResponseModel extends NotificationResponse {
  NotificationResponseModel({
    required super.count,
    required super.results,
    super.next,
    super.previous,
  });

  factory NotificationResponseModel.fromJson(Map<String, dynamic> json) {
    return NotificationResponseModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: List<NotificationModel>.from(
        json['results'].map((item) => NotificationModel.fromJson(item)),
      ),
    );
  }
}
