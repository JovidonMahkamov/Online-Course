
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio1/features/home/presentation/bloc/wishlist/wishlist_state.dart';

import '../../../domain/use_cases/wishlist_use_case.dart';
import '../home_event.dart';

class WishlistBloc extends Bloc<HomeEvent, WishlistState> {
  final WishlistUseCase wishlistUseCase;

  WishlistBloc(this.wishlistUseCase) : super(WishlistInitial()) {
    on<GetWishlistEvent>(onGetWishlist);
  }

  Future<void> onGetWishlist(event, emit) async {
    emit(WishlistLoading());
    try {
      final wishlist = await wishlistUseCase(
        limit: event.limit,
        categoryId: event.categoryId,
      );
      emit(WishlistLoaded(wishlistResponse: wishlist));
    } catch (e) {
      emit(WishlistError(message: e.toString()));
    }
  }
}
