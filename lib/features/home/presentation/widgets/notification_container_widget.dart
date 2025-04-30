import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationContainerWidget extends StatelessWidget {
  final String image;
  final String text;
  final String text1;
  const NotificationContainerWidget({super.key,required this.text,required this.image,required this.text1});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white
      ),
      width: 380.w,
      height: 112.h,
      child: Row(
        children: [
          Image.asset(image),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: TextStyle(fontSize: 18.sp),
              ),
              SizedBox(height: 10.h,),
              Text(
                text1,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey[300],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
