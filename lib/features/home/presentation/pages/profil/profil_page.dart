import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/route/route_names.dart';
import '../../widgets/profile_widgets/container_widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _imageFile;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 15.w,
            ),
            Container(
              width: 37.w,
              height: 37.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: AssetImage('assets/profile/circular_e1.png'),
                  )),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              children: [
                Text(
                  "Profile",
                  style: TextStyle(fontSize: 24.sp, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.homeNotification);
            },
            icon: const Icon(IconlyLight.more_circle),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: _imageFile != null
                          ? FileImage(_imageFile!)
                          : const AssetImage('assets/profile/avatar_person.png')
                              as ImageProvider,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              // color: Colors.blue,
                            ),
                            child: Image.asset('assets/profile/pen_icon.png')),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Andrew Ainsley',
                  style: TextStyle(fontSize: 24.sp),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  'andrew_ainsley@yourdomain.com',
                  style: TextStyle(fontSize: 14.sp),
                ),
                SizedBox(
                  height: 30.h,
                ),
                SizedBox(
                  width: double.infinity.w,
                  child: Divider(
                    height: 3.h,
                    color: Colors.grey[400],
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                ContainerWidgets(
                  text: 'Edit Profile',
                  icon: IconlyLight.profile,
                  icon1: IconlyLight.arrow_right_2,
                  onTab: () {
                    Navigator.pushNamed(context, RouteNames.settingEditProfile);
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                ContainerWidgets(
                  text: 'Notification',
                  icon: IconlyLight.notification,
                  icon1: IconlyLight.arrow_right_2,
                  onTab: () {
                    Navigator.pushNamed(
                        context, RouteNames.settingNotification);
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                ContainerWidgets(
                  text: 'Payment',
                  icon: IconlyLight.wallet,
                  icon1: IconlyLight.arrow_right_2,
                  onTab: () {Navigator.pushNamed(context, RouteNames.settingPayment);},
                ),
                SizedBox(
                  height: 20.h,
                ),
                ContainerWidgets(
                  text: 'Security',
                  icon: IconlyLight.shield_done,
                  icon1: IconlyLight.arrow_right_2,
                  onTab: () {Navigator.pushNamed(context, RouteNames.security);},
                ),
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  onTap: () {Navigator.pushNamed(context, RouteNames.language);},
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(IconlyLight.more_circle),
                            SizedBox(
                              width: 20.w,
                            ),
                            Text(
                              'Language',
                              style: TextStyle(fontSize: 18.sp),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'English (US)',
                              style: TextStyle(fontSize: 18.sp),
                            ),
                            SizedBox(
                              width: 25.w,
                            ),
                            const Icon(IconlyLight.arrow_right_2),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(IconlyLight.show),
                            SizedBox(
                              width: 20.w,
                            ),
                            Text(
                              'Dark Mode',
                              style: TextStyle(fontSize: 18.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 25.w,
                        ),
                        Container(
                          child: CupertinoSwitch(
                            activeColor: Colors.blueAccent,
                            trackColor: Colors.grey[300],
                            value: isOn,
                            onChanged: (bool value) {
                              setState(() {
                                isOn = value;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ContainerWidgets(
                  text: 'Privacy Policy',
                  icon: IconlyLight.lock,
                  icon1: IconlyLight.arrow_right_2,
                  onTab: () {},
                ),
                SizedBox(
                  height: 20.h,
                ),
                ContainerWidgets(
                  text: 'Help Center',
                  icon: IconlyLight.info_square,
                  icon1: IconlyLight.arrow_right_2,
                  onTab: () {},
                ),
                SizedBox(
                  height: 20.h,
                ),
                ContainerWidgets(
                  text: 'Invite Friends',
                  icon: IconlyLight.user_1,
                  icon1: IconlyLight.arrow_right_2,
                  onTab: () {},
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    const Icon(
                      IconlyLight.logout,
                      color: Colors.red,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Logout',
                        style: TextStyle(fontSize: 18, color: Colors.red),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
