import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../../widgets/top_mentors_wodgets.dart';

class TopMentorsPage extends StatefulWidget {
  const TopMentorsPage({super.key});

  @override
  State<TopMentorsPage> createState() => _TopMentorsPageState();
}

class _TopMentorsPageState extends State<TopMentorsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Top Mentors',
          style: TextStyle(fontSize: 25.sp),
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
            icon: Icon(IconlyLight.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 25, left: 25, right: 25),
          child: Column(
            children: [
              TopMentorsWidgets(imageProvider: 'assets/home/people1.png', text: 'Jacob Kulikowski', text1: 'Marketing Analyst',),SizedBox(height: 25.h,),
              TopMentorsWidgets(imageProvider: 'assets/home/people2.png', text: 'Jacob Kulikowski', text1: 'Marketing Analyst',),SizedBox(height: 25.h,),
              TopMentorsWidgets(imageProvider: 'assets/home/people3.png', text: 'Jacob Kulikowski', text1: 'Marketing Analyst',),SizedBox(height: 25.h,),
              TopMentorsWidgets(imageProvider: 'assets/home/people4.png', text: 'Jacob Kulikowski', text1: 'Marketing Analyst',),SizedBox(height: 25.h,),
              TopMentorsWidgets(imageProvider: 'assets/home/people5.png', text: 'Jacob Kulikowski', text1: 'Marketing Analyst',),SizedBox(height: 25.h,),
              TopMentorsWidgets(imageProvider: 'assets/home/people1.png', text: 'Jacob Kulikowski', text1: 'Marketing Analyst',),SizedBox(height: 25.h,),
              TopMentorsWidgets(imageProvider: 'assets/home/people2.png', text: 'Jacob Kulikowski', text1: 'Marketing Analyst',),SizedBox(height: 25.h,),
              TopMentorsWidgets(imageProvider: 'assets/home/people3.png', text: 'Jacob Kulikowski', text1: 'Marketing Analyst',),SizedBox(height: 25.h,),
            ],
          ),
        ),
      ),
    );
  }
}
