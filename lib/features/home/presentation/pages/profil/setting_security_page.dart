import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import '../../widgets/profile_widgets/notification_widget.dart';

class SettingSecurityPage extends StatefulWidget {
  const SettingSecurityPage({super.key});

  @override
  State<SettingSecurityPage> createState() => _SettingSecurityPageState();
}

class _SettingSecurityPageState extends State<SettingSecurityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          'Security',
          style: TextStyle(fontSize: 25.sp),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            NotificationWidget(text: 'Remember me', onTab: () {}),
            NotificationWidget(text: 'Face ID', onTab: () {}),
            NotificationWidget(text: 'Biometric ID', onTab: () {}),
            SizedBox(
              height: 25.h,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Google Authenticator',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                      ],
                    ),
                    // Text(widget.language,style: TextStyle(fontSize: 18.sp),),

                    const Icon(
                      IconlyLight.arrow_right_2,
                      color: Colors.blueAccent,
                    ),
                  ],
                ),
              ),
            ),
        SizedBox(
          height: 25.w,
        ),
        SizedBox(
          width: double.infinity.w,
          height: 58.h,
          child: ElevatedButton(

            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffEBEFFE),
              minimumSize: const Size(double.infinity, 49),
            ),
            child: const Text('Change Pin',style: TextStyle(color: Colors.blue),),
          ),
        ),
        SizedBox(
          height: 25.w,
        ),
        SizedBox(
          width: double.infinity.w,
          height: 58.h,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffEBEFFE),
              minimumSize: const Size(double.infinity, 49),
            ),
            child: const Text('Change Password',style: TextStyle(color: Colors.blue),),
          ),
        )
          ],
        ),
      ),
    );
  }
}
