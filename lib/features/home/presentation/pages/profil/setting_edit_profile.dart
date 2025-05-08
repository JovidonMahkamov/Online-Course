import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:portfolio1/features/home/presentation/widgets/profile_widgets/states_edit_widgets.dart';

import '../../../../../core/route/route_names.dart';
import '../../../../auth/presentation/widgets/date_of_birth_piker.dart';
import '../../../../auth/presentation/widgets/eleveted_widgets.dart';
import '../../../../auth/presentation/widgets/gender_selection.dart';
import '../../../../auth/presentation/widgets/text_filed_widget1.dart';

class SettingEditProfile extends StatefulWidget {
  const SettingEditProfile({super.key});

  @override
  State<SettingEditProfile> createState() => _SettingEditProfileState();
}

class _SettingEditProfileState extends State<SettingEditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back),) ,
        title: Text('Edit Profile',style: TextStyle(fontSize: 25.sp),),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20,top: 30, right: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                 TextFiledWidget1(
                  text: 'Full Name',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                 TextFiledWidget1(
                  text: 'Nickname ',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                DateOfBirthPicker(),
                const SizedBox(
                  height: 25,
                ),
                TextFiledWidget1(
                  text: 'Email ',
                  obscureText: false,
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        IconlyLight.message,
                        color: Colors.grey,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                const StatesEditWidgets(),
                const SizedBox(
                  height: 20,
                ),
                 TextFiledWidget1(
                  text: 'Phone Number ',
                  obscureText: false,
                  prefixIcon: Icon(
                    IconlyLight.arrow_down_2,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const GenderSelection(),
                const SizedBox(
                  height: 20,
                ),
                 TextFiledWidget1(
                  text: 'Jobs',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 30,
                ),
                LogInElevated(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.createNewPinPage);
                    },
                    text: 'Update'),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
