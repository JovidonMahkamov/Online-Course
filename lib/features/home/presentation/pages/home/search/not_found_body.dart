import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotFoundPage extends StatefulWidget {
  const NotFoundPage({super.key});

  @override
  _NotFoundPageState createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  String? selectedButton = 'Courses';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 14),
        child: Column(
          children: [
            SizedBox(height: 60.h),
            Image.asset('assets/images/error.png'),
            SizedBox(height: 20),
            Text(
              'Not Found',
              style: TextStyle(
                fontSize: 24,
                color: Colors.grey[900],
              ),
            ),
            Text(
              'Sorry, the keyword you entered cannot be\n found, please check again or search with\n another keyword.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[900],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
