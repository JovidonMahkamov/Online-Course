import 'category.dart';

class CategoryResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<Category> results;

  CategoryResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });
}

