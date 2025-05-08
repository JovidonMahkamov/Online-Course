
import '../../../domain/entities/response_wishlist.dart';

abstract class WishlistState {
  const WishlistState();
}

class WishlistInitial extends WishlistState {}

class WishlistLoading extends WishlistState {}

class WishlistLoaded extends WishlistState {
  final WishlistResponse wishlistResponse;

  const WishlistLoaded({required this.wishlistResponse});
}

class WishlistError extends WishlistState {
  final String message;

  const WishlistError({required this.message});
}
