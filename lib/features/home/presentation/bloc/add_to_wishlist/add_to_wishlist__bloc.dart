
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/add_to_wishlist_use_case.dart';
import '../home_event.dart';
import 'add_to_wishlist__state.dart';

class AddWishlistBloc extends Bloc<HomeEvent, WishlistState> {
  final AddToWishlistUseCase addToWishlistUseCase;

  AddWishlistBloc(this.addToWishlistUseCase) : super(WishlistInitial()) {
    on<AddToWishlistEvent>(onAddToWishlist);
  }

  Future<void> onAddToWishlist(
    AddToWishlistEvent event,
    Emitter<WishlistState> emit,
  ) async {
    emit(WishlistLoading());
    try {
      addToWishlistUseCase(event.courseId);
      emit(WishlistSuccess());
    } catch (e) {
      emit(WishlistError(message: e.toString()));
    }
  }
}
