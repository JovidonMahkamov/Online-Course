import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/notification_container_widget.dart';

class HomeNotificationPage extends StatefulWidget {
  const HomeNotificationPage({super.key});

  @override
  State<HomeNotificationPage> createState() => _HomeNotificationPageState();
}

class _HomeNotificationPageState extends State<HomeNotificationPage> {
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
      body:  SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 25, right: 25, top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Today',
                style: TextStyle(fontSize: 18),
              ),
              const NotificationContainerWidget(text: 'Payment Successful!', image: 'assets/home/notification.png', text1: 'You have made a course payment',),SizedBox(height: 25.h,),
              const NotificationContainerWidget(text: 'Payment Successful!', image: 'assets/home/notification1.png', text1: 'You have made a course payment',),SizedBox(height: 25.h,),
              SizedBox(height: 25.h,),
              const Text(
                'Yesterday',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 25.h,),
              const NotificationContainerWidget(text: 'Payment Successful!', image: 'assets/home/notification.png', text1: 'You have made a course payment',),SizedBox(height: 25.h,),
              const NotificationContainerWidget(text: 'Payment Successful!', image: 'assets/home/notification3.png', text1: 'You have made a course payment',),SizedBox(height: 25.h,),
              SizedBox(height: 25.h,),
              const Text(
                'Yesterday',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 25.h,),
              const NotificationContainerWidget(text: 'Payment Successful!', image: 'assets/home/notification4.png', text1: 'You have made a course payment',),SizedBox(height: 25.h,),
            ],
          ),
        ),
      ),
    );
  }
}
