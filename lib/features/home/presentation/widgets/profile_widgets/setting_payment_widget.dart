import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingPaymentWidget extends StatefulWidget {
  final String image;
  final String text;

  const SettingPaymentWidget(
      {super.key, required this.image, required this.text});

  @override
  State<SettingPaymentWidget> createState() => _SettingPaymentWidgetState();
}

class _SettingPaymentWidgetState extends State<SettingPaymentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // SizedBox(width: 10,),
            Row(
              children: [
                Image.asset(widget.image),
                SizedBox(
                  width: 20.h,
                ),
                Text(widget.text),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: Text('connected',style: TextStyle(color: Colors.blueAccent),),
            ),
          ],
        ),
      ),
    );
  }
}
