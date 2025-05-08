abstract class RemoveFromWishlistState {
  const RemoveFromWishlistState();
}

class RemoveFromWishlistInitial extends RemoveFromWishlistState {}

class RemoveFromWishlistLoading extends RemoveFromWishlistState {}

class RemoveFromWishlistSuccess extends RemoveFromWishlistState {
  const RemoveFromWishlistSuccess();
}

class RemoveFromWishlistError extends RemoveFromWishlistState {
  final String message;

  const RemoveFromWishlistError({required this.message});
}
