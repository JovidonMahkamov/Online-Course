import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_cases/category_use_case.dart';
import '../home_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<HomeEvent, CategoryState> {
  final CategoryUseCase getCategoryUseCase;

  CategoryBloc(this.getCategoryUseCase) : super(CategoryInitial()) {
    on<GetCategoriesEvent>(onGetCategories);
  }

  Future<void> onGetCategories(GetCategoriesEvent event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());
    try {
      final categories = await getCategoryUseCase(limit: event.limit);
      emit(CategoryLoaded(categories: categories));
    } catch (e) {
      emit(CategoryError(message: e.toString()));
    }
  }
}
