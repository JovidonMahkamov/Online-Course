abstract class WishlistState {
  const WishlistState();
}

class WishlistInitial extends WishlistState {}

class WishlistLoading extends WishlistState {}

class WishlistSuccess extends WishlistState {
  const WishlistSuccess();
}

class WishlistError extends WishlistState {
  final String message;

  const WishlistError({required this.message});
}
