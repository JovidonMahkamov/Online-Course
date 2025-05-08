import 'package:flutter/material.dart';

class CourseInfoWidget extends StatelessWidget {
  final Icon icon;
  final String title;

  const CourseInfoWidget({required this.icon, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        SizedBox(width: 5),
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
