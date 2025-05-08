import '../../../domain/entities/notification_response.dart';

abstract class NotificationState {
  const NotificationState();
}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final NotificationResponse notifications;

  const NotificationLoaded({required this.notifications});
}

class NotificationError extends NotificationState {
  final String message;

  const NotificationError({required this.message});
}
