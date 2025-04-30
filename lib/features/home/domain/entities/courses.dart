
import 'package:portfolio1/features/home/domain/entities/section.dart';

class Course {
  final int id;
  final String title;
  final String description;
  final int? category;
  final String price;
  final String? image;
  final bool isPublished;
  final String createdAt;
  final String instructor;
  final List<Section> sections;

  Course({
    required this.id,
    required this.title,
    required this.description,
    this.category,
    required this.price,
    this.image,
    required this.isPublished,
    required this.createdAt,
    required this.instructor,
    required this.sections,
  });

}