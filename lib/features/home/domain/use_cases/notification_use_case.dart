
import '../entities/notification_response.dart';
import '../repositories/home_repo.dart';

class NotificationUseCase {
  final HomeRepo homeRepo;

  NotificationUseCase(this.homeRepo);

  Future<NotificationResponse> call() async {
    return await homeRepo.getNotifications();
  }
}
