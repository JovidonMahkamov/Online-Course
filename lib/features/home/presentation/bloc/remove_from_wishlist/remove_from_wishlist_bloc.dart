import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_cases/remove_from_wishlist_use_case.dart';
import '../home_event.dart';
import 'remove_from_wishlist_state.dart';

class RemoveFromWishlistBloc extends Bloc<HomeEvent, RemoveFromWishlistState> {
  final RemoveFromWishlistUseCase removeFromWishlistUseCase;

  RemoveFromWishlistBloc(this.removeFromWishlistUseCase)
    : super(RemoveFromWishlistInitial()) {
    on<RemoveFromWishlistEvent>(onRemoveFromWishlist);
  }

  Future<void> onRemoveFromWishlist(event, emit) async {
    emit(RemoveFromWishlistLoading());
    try {
      removeFromWishlistUseCase(courseId: event.courseId);
      emit(RemoveFromWishlistSuccess());
    } catch (e) {
      emit(RemoveFromWishlistError(message: e.toString()));
    }
  }
}
