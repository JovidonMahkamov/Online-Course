
import '../../domain/entities/category_responce.dart';
import 'category_model.dart';

class CategoryResponseModel extends CategoryResponse {
  CategoryResponseModel({
    required super.count,
    required super.next,
    required super.previous,
    required super.results,
  });

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) {
    return CategoryResponseModel(
      count: json['count'] ?? 0,
      next: json['next'] ?? '',
      previous: json['previous'] ?? '',
      results:
          (json['results'] as List<dynamic>)
              .map((item) => CategoryModel.fromJson(item))
              .toList(),
    );
  }
}
