class Wishlist {
  final int id;
  final int courseId;
  final String courseTitle;
  final String? courseImage;
  final String categoryName;
  final String instructor;
  final DateTime createdAt;
  final String price;

  Wishlist({
    required this.id,
    required this.courseId,
    required this.courseTitle,
    required this.categoryName,
    required this.price,
    this.courseImage,
    required this.instructor,
    required this.createdAt,
  });

  factory Wishlist.fromJson(Map<String, dynamic> json) {
    return Wishlist(
      id: json['id'],
      courseId: json['course_id'],
      courseTitle: json['course_title'],
      price: json['price'],
      categoryName: json['category_name'],
      courseImage: json['course_image'],
      instructor: json['instructor'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
