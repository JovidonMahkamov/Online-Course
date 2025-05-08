import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/notification_use_case.dart';
import '../home_event.dart';
import 'notification_state.dart';

class NotificationBloc extends Bloc<HomeEvent, NotificationState> {
  final NotificationUseCase getNotificationUseCase;

  NotificationBloc(this.getNotificationUseCase) : super(NotificationInitial()) {
    on<GetNotificationEvent>(onGetNotifications);
  }

  Future<void> onGetNotifications(event, emit) async {
    emit(NotificationLoading());
    try {
      final notifications = await getNotificationUseCase();
      emit(NotificationLoaded(notifications: notifications));
    } catch (e) {
      emit(NotificationError(message: e.toString()));
    }
  }
}
