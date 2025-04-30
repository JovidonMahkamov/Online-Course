import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio1/features/home/presentation/widgets/profile_widgets/notification_widget.dart';

class SettingNotificationPage extends StatefulWidget {
  const SettingNotificationPage({super.key});

  @override
  State<SettingNotificationPage> createState() =>
      _SettingNotificationPageState();
}

class _SettingNotificationPageState extends State<SettingNotificationPage> {
  bool isOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: Text(
          'Notification',
          style: TextStyle(fontSize: 25.sp),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
        child: Column(
          children: [
            NotificationWidget(text: 'General Notification',onTab: (){},),
            NotificationWidget(text: 'Sound ',onTab: (){},),
            NotificationWidget(text: 'Vibrate ',onTab: (){},),
            NotificationWidget(text: 'Special Offers',onTab: (){},),
            NotificationWidget(text: 'Promo & Discount',onTab: (){},),
            NotificationWidget(text: 'Payments ',onTab: (){},),
            NotificationWidget(text: 'Cashback ',onTab: (){},),
            NotificationWidget(text: 'App Updates',onTab: (){},),
            NotificationWidget(text: 'New Service Available',onTab: (){},),
            NotificationWidget(text: 'New Tips Available ',onTab: (){},),
          ],
        ),),
      ),
    );
  }
}
