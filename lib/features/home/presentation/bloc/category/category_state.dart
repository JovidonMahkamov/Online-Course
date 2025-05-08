import '../../../domain/entities/category_responce.dart';

abstract class CategoryState {
  const CategoryState();
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final CategoryResponse categories;

  const CategoryLoaded({required this.categories});
}

class CategoryError extends CategoryState {
  final String message;

  const CategoryError({required this.message});
}
