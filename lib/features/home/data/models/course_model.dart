
import '../../domain/entities/courses.dart';
import '../../domain/entities/sections.dart';

class CourseModel extends Course {
  CourseModel({
    required super.id,
    required super.title,
    required super.description,
    required super.price,
    required super.isPublished,
    required super.createdAt,
    required super.instructor,
    required super.sections,
    required super.category,
    required super.categoryName,
    required super.image,
    required super.isInWishlist,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      categoryName: json['category_name'] ?? '',
      price: json['price'] ?? 0.0,
      image: json['image'] ?? '',
      isPublished: json['is_published'] ?? false,
      createdAt: json['created_at'] ?? '',
      instructor: json['instructor'] ?? '',
      isInWishlist: json['is_in_wishlist'] ?? false,
      sections:
          (json['sections'] as List?)
              ?.map((e) => Section.fromJson(e))
              .toList() ??
          [],
    );
  }
}
