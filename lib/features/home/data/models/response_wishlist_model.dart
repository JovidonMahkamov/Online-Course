
import '../../domain/entities/response_wishlist.dart';
import 'course_model.dart';

class ResponseWishlistModel extends WishlistResponse {
  ResponseWishlistModel({
    required super.count,
    required super.results,
    super.next,
    super.previous,
  });

  factory ResponseWishlistModel.fromJson(Map<String, dynamic> json) {
    return ResponseWishlistModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results:
          (json['results'] as List)
              .map((e) => CourseModel.fromJson(e))
              .toList(),
    );
  }
}
