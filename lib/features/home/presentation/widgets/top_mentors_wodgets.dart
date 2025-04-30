import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class TopMentorsWidgets extends StatefulWidget {
  final String imageProvider;
  String text;
  String text1;

  TopMentorsWidgets(
      {super.key,
      required this.imageProvider,
      required this.text,
      required this.text1});

  @override
  State<TopMentorsWidgets> createState() => _TopMentorsWidgetsState();
}

class _TopMentorsWidgetsState extends State<TopMentorsWidgets> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(widget.imageProvider),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.text,
                      style: TextStyle(fontSize: 18.sp),
                    ),
                    Text(
                      widget.text1,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(IconlyLight.chat)),
          ],
        ),
      ),
    );
  }
}
