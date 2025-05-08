import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import '../bloc/add_to_wishlist/add_to_wishlist__bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/remove_from_wishlist/remove_from_wishlist_bloc.dart';

class CourseCard extends StatefulWidget {
  final String imagePath;
  final String category;
  final String title;
  final double price;
  final double oldPrice;
  final double rating;
  final int students;
  final VoidCallback onBookmarkPressed;
  final VoidCallback onTap;
  final bool? isInWishlist;
  final int? courseId;

  const CourseCard({
    super.key,
    required this.imagePath,
    required this.category,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.rating,
    required this.students,
    required this.onBookmarkPressed,
    required this.onTap,
    this.isInWishlist,
    this.courseId,
  });

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  late bool isBookmarked;

  @override
  void initState() {
    super.initState();
    isBookmarked = widget.isInWishlist ?? false;
  }

  void toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
    });

    if (isBookmarked) {
      context.read<AddWishlistBloc>().add(
        AddToWishlistEvent(courseId: widget.courseId!),
      );
    } else {
      context.read<RemoveFromWishlistBloc>().add(
        RemoveFromWishlistEvent(courseId: widget.courseId!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.only(top: (15)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
        ),
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SizedBox(
                width: (120),
                height: (120),
                child: CachedNetworkImage(
                  imageUrl: widget.imagePath,
                  fit: BoxFit.cover,
                  errorWidget:
                      (context, url, error) =>
                      Image.asset("assets/images/img.png"),
                ),
              ),
            ),
            SizedBox(width: (16)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: (12),
                          vertical: (4),
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffEFF3FF),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          widget.category,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: toggleBookmark,
                        icon: Icon(
                          isBookmarked
                              ? IconlyBold.bookmark
                              : IconlyLight.bookmark,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[900],
                    ),
                  ),
                  SizedBox(height: (7)),
                  Row(
                    children: [
                      Text(
                        "\$${widget.price}",
                        style:TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(width: (8)),
                      Text(
                        "\$${widget.oldPrice}",
                        style: TextStyle(
                          fontSize: (12),
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: (5)),
                  Row(
                    children: [
                      Icon(IconlyBold.star, color: Color(0xffFB9400)),
                      SizedBox(width: (4)),
                      Text(
                        '${widget.rating}  |  ${widget.students} students',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
