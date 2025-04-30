import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopMentorsWidget extends StatelessWidget {

  const TopMentorsWidget(
      {super.key,});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
           TopMentorsWidget1(
            imageProvider: 'assets/home/people1.png',
            text: 'Jacob',
          ),
          SizedBox(
            width: 13.w,
          ),
           TopMentorsWidget1(
            imageProvider: 'assets/home/people2.png',
            text: 'Claire',
          ),
          SizedBox(
            width: 13.w,
          ),
           TopMentorsWidget1(
            imageProvider: 'assets/home/people3.png',
            text: 'Priscilla',
          ),
          SizedBox(
            width: 13.w,
          ),
           TopMentorsWidget1(
            imageProvider: 'assets/home/people4.png',
            text: 'Wade',
          ),
          SizedBox(
            width: 13.w,
          ),
           TopMentorsWidget1(
            imageProvider: 'assets/home/people5.png',
            text: 'Kathryn',
          ),
          SizedBox(
            width: 13.w,
          ),
        ],
      ),
    );
  }
  Column TopMentorsWidget1({required String imageProvider, required String text}){
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(imageProvider),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 16.sp),
        ),
      ],
    );
  }
}
