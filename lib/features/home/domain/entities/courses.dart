
import 'package:portfolio1/features/home/domain/entities/sections.dart';

class Course {
  final int id;
  final String title;
  final String description;
  final int? category;
  final String? categoryName;
  final String price;
  final String? image;
  final bool isPublished;
  final String createdAt;
  final String instructor;
  final bool isInWishlist;
  final List<Section> sections;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.isInWishlist,
    this.category,
    this.categoryName,
    required this.price,
    this.image,
    required this.isPublished,
    required this.createdAt,
    required this.instructor,
    required this.sections,
  });
}
