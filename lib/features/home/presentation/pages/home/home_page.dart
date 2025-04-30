import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:portfolio1/core/route/route_names.dart';

import '../../widgets/container_widget1.dart';
import '../../widgets/eleveted_widgets.dart';
import '../../widgets/text_field_widget.dart';
import '../../widgets/top_mentors_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isColor =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SizedBox(
              width: 15.w,
              height: 15,
            ),
            const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/home/home_profil.png'),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              children: [
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "Good Morning 👋",
                  style: TextStyle(
                      fontSize: 16.sp, color: const Color(0xff757575)),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Andrew Ainsley",
                  style: TextStyle(
                      fontSize: 20.sp, color: const Color(0xff212121)),
                ),
                SizedBox(height: 5.h,)
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {Navigator.pushNamed(context, RouteNames.homeNotification);},
            icon: const Icon(IconlyLight.notification),
          ),
          IconButton(
            onPressed: () {Navigator.pushNamed(context, RouteNames.mostPopularCourses);},
            icon: const Icon(IconlyLight.bookmark),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25,),
                child: Column(
                  children: [
                    TextFieldWidget(),
                    Image.asset(
                      'assets/home/big_container.png',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 25,left: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Top Mentors",
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            onPressed: () {Navigator.pushNamed(context, RouteNames.topMentors);},
                            child: Text(
                              'See All',
                              style: TextStyle(
                                  color: Colors.blueAccent, fontSize: 16.sp),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                  ],
                ),
              ),
              const TopMentorsWidget(),
              SizedBox(
                height: 15.h,
              ),
              Container(
                padding: const EdgeInsets.only( right: 25,left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Most Popular Courses",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {Navigator.pushNamed(context, RouteNames.homeMyBookmark);},
                      child: Text(
                        'See All',
                        style: TextStyle(
                            color: Colors.blueAccent, fontSize: 16.sp),
                      ),
                    )
                  ],
                ),
              ),
               SingleChildScrollView(scrollDirection: Axis.horizontal,child: ElevetedWidgets(),),
              SizedBox(height: 25.h,),
               Padding(
                padding: EdgeInsets.only(right: 25),
                child: ContainerWidget1(image: 'assets/home/Rectangle.png', width: 67, height: 24, text: '3D Design Illustration', text1: '\$48', text2: '\$80', text3: '4.8  |  8,289 students', text4: '3D Design', onPressed: () {
                  setState(() {
                    isColor = !isColor;
                  });
                }, icon: isColor
                    ? const Icon(
                  IconlyBold.bookmark,
                  color: Colors.blueAccent,
                )
                    : const Icon(
                  IconlyLight.bookmark,
                  color: Colors.blueAccent,
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
