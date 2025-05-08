import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:portfolio1/core/route/route_names.dart';

import '../../domain/entities/courses.dart';

class AboutScreen extends StatefulWidget {
  final Course course;

  const AboutScreen({super.key, required this.course});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mentor',
            style: TextStyle(
              fontSize: 26,
              color: Colors.black,
            ),
          ),
          GestureDetector(
            onTap: () {
             Navigator.pushNamed(context, RouteNames.mentorProfilePage);
            },
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(
                  IconlyBold.user_3,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              title: Text(
                widget.course.instructor,
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                'Senior UI/UX Designer at Google',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),
              trailing: Icon(IconlyLight.chat, size: 23, color: Colors.blue),
            ),
          ),
          Text(
            'About Course',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.course.description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Tools',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Image.asset('assets/home/figma_logo.png'),
              const SizedBox(width: 5),
              Text(
                "Figma",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
