
import '../repositories/home_repo.dart';

class RemoveFromWishlistUseCase {
  final HomeRepo wishlistRepository;

  RemoveFromWishlistUseCase(this.wishlistRepository);

  Future<void> call({required int courseId}) async {
    await wishlistRepository.removeFromWishlist(courseId: courseId);
  }
}
