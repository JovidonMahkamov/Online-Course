import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../../widgets/container_widget1.dart';
import '../../widgets/eleveted_widgets.dart';

class MostPopularCoursesPage extends StatefulWidget {
  const MostPopularCoursesPage({super.key});

  @override
  State<MostPopularCoursesPage> createState() => _MostPopularCoursesPageState();
}

class _MostPopularCoursesPageState extends State<MostPopularCoursesPage> {
  bool isColor = false;
  bool isColor1 = false;
  bool isColor2 = false;
  bool isColor3 = false;
  bool isColor4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Most Popular Courses',
          style: TextStyle(fontSize: 25),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(IconlyLight.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ElevetedWidgets(),
            ),
            SizedBox(
              height: 35.h,
            ),
            ContainerWidget1(
              image: 'assets/home/Rectangle.png',
              width: 67,
              height: 24,
              text: '3D Design Illustration',
              text1: '\$48',
              text2: '\$80',
              text3: '4.8  |  8,289 students',
              text4: '3D Design',
              onPressed: () {
                setState(() {
                  isColor = !isColor;
                });
              },
              icon: isColor
                  ? const Icon(
                      IconlyBold.bookmark,
                      color: Colors.blueAccent,
                    )
                  : const Icon(
                      IconlyLight.bookmark,
                      color: Colors.blueAccent,
                    ),
            ),
            SizedBox(
              height: 25.h,
            ),
            ContainerWidget1(
              image: 'assets/home/Rectangle1.png',
              width: 67,
              height: 24,
              text: '3D Design Illustration',
              text1: '\$48',
              text2: '\$80',
              text3: '4.8  |  8,289 students',
              text4: '3D Design',
              onPressed: () {
                setState(() {
                  isColor2 = !isColor2;
                });
              },
              icon: isColor2
                  ? const Icon(
                      IconlyBold.bookmark,
                      color: Colors.blueAccent,
                    )
                  : const Icon(
                      IconlyLight.bookmark,
                      color: Colors.blueAccent,
                    ),
            ),
            SizedBox(
              height: 25.h,
            ),
            ContainerWidget1(
              image: 'assets/home/Rectangle2.png',
              width: 67,
              height: 24,
              text: '3D Design Illustration',
              text1: '\$48',
              text2: '\$80',
              text3: '4.8  |  8,289 students',
              text4: '3D Design',
              onPressed: () {
                setState(() {
                  isColor1 = !isColor1;
                });
              },
              icon: isColor1
                  ? const Icon(
                      IconlyBold.bookmark,
                      color: Colors.blueAccent,
                    )
                  : const Icon(
                      IconlyLight.bookmark,
                      color: Colors.blueAccent,
                    ),
            ),
            SizedBox(
              height: 25.h,
            ),
            ContainerWidget1(
              image: 'assets/home/Rectangle3.png',
              width: 67,
              height: 24,
              text: '3D Design Illustration',
              text1: '\$48',
              text2: '\$80',
              text3: '4.8  |  8,289 students',
              text4: '3D Design',
              onPressed: () {
                setState(() {
                  isColor3 = !isColor3;
                });
              },
              icon: isColor3
                  ? const Icon(
                      IconlyBold.bookmark,
                      color: Colors.blueAccent,
                    )
                  : const Icon(
                      IconlyLight.bookmark,
                      color: Colors.blueAccent,
                    ),
            ),
            SizedBox(
              height: 25.h,
            ),
            ContainerWidget1(
              image: 'assets/home/Rectangle4.png',
              width: 67,
              height: 24,
              text: '3D Design Illustration',
              text1: '\$48',
              text2: '\$80',
              text3: '4.8  |  8,289 students',
              text4: '3D Design',
              onPressed: () {
                setState(() {
                  isColor4 = !isColor4;
                });
              },
              icon: isColor4
                  ? const Icon(
                      IconlyBold.bookmark,
                      color: Colors.blueAccent,
                    )
                  : const Icon(
                      IconlyLight.bookmark,
                      color: Colors.blueAccent,
                    ),
            ),
            SizedBox(
              height: 25.h,
            ),
          ],
        ),
      ),
    );
  }
}
