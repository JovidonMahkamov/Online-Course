import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../auth/presentation/widgets/eleveted_widgets.dart';

class ContainerWidget1 extends StatefulWidget {
  final String image;
  final double width;
  final double height;
  final String text;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final VoidCallback onPressed;
  final Icon icon;

  const ContainerWidget1(
      {super.key,
      required this.image,
      required this.width,
      required this.height,
      required this.text,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.text4,
      required this.onPressed,
      required this.icon});

  @override
  State<ContainerWidget1> createState() => _ContainerWidget1State();
}

class _ContainerWidget1State extends State<ContainerWidget1> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _showBottomSheet(context);
        });
      },
      child: Container(
        padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
        height: 160.h,
        width: 380.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(widget.image),
            SizedBox(
              width: 15.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(8)),
                  width: widget.width.w,
                  height: widget.height.h,
                  child: Center(
                      child: Text(
                    widget.text4,
                    style: TextStyle(fontSize: 10.sp, color: Colors.blueAccent),
                  )),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Text(
                  widget.text,
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Row(
                  children: [
                    Text(
                      widget.text1,
                      style:
                          TextStyle(fontSize: 18.sp, color: Colors.blueAccent),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      widget.text2,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[300],
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                Text(
                  widget.text3,
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey[300]),
                )
              ],
            ),
            IconButton(onPressed: widget.onPressed, icon: widget.icon),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(
    BuildContext context,
  ) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Container(
          height: 428.h,
          padding: const EdgeInsets.only(top: 10,left: 15,right: 15,bottom: 15),
          child: Column(
            children: [
              SizedBox(
                width: 40.h,
                height: 10.w,
                child: Divider(
                  color: Colors.grey,
                  height: 3.h,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'Remove from Bookmark?',
                style: TextStyle(fontSize: 25.sp),
              ),
              SizedBox(
                height: 12.h,
              ),
              SizedBox(
                width: double.infinity.h,
                height: 10.w,
                child: Divider(
                  color: Colors.grey[400],
                  height: 3.h,
                ),
              ),SizedBox(
                height: 12.h,
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                height: 170.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(widget.image),
                    SizedBox(
                      width: 15.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.blue[100],
                              borderRadius: BorderRadius.circular(8)),
                          width: widget.width.w,
                          height: widget.height.h,
                          child: Center(
                              child: Text(
                            widget.text4,
                            style: TextStyle(
                                fontSize: 10.sp, color: Colors.blueAccent),
                          )),
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        Text(
                          widget.text,
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        Row(
                          children: [
                            Text(
                              widget.text1,
                              style: TextStyle(
                                  fontSize: 18.sp, color: Colors.blueAccent),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              widget.text2,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.grey[300],
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          widget.text3,
                          style:
                              TextStyle(fontSize: 12.sp, color: Colors.grey[300]),
                        )
                      ],
                    ),
                    IconButton(onPressed: widget.onPressed, icon: widget.icon),

                  ],
                ),
              ),
              SizedBox(height: 35.h,),
              Row(
                children: [
                  SizedBox(
                    width: 184.w,
                    height: 70.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffEBEFFE),
                        minimumSize: const Size(double.infinity, 49),
                      ),
                      child: const Text('Cancel'),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  SizedBox(
                    width: 184.w,
                    height: 70.h,
                    child: LogInElevated(
                        onPressed: () {
                        },
                        text: 'Yes, Remove'),
                  ),
                ],
              ),],
          ),
        );
      },
    );
  }
}
