import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationWidget extends StatefulWidget {
  final String text;
  final VoidCallback onTab;

  const NotificationWidget({
    super.key,
    required this.text,
    required this.onTab,
  });

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTab,
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 25,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      widget.text,
                      style: TextStyle(fontSize: 18.sp),
                    ),
                  ],
                ),
                Container(
                  child: CupertinoSwitch(
                    activeColor: Colors.blueAccent,
                    trackColor: Colors.grey[300],
                    value: isOn,
                    onChanged: (bool value) {
                      setState(() {
                       isOn  = value;
                      });
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
