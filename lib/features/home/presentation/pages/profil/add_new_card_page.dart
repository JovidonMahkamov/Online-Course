import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:portfolio1/features/auth/presentation/widgets/eleveted_widgets.dart';

import '../../../../auth/presentation/widgets/date_of_birth_piker.dart';
import '../../../../auth/presentation/widgets/text_filed_widget1.dart';
import '../../widgets/profile_widgets/text_field_widget.dart';

class AddNewCardPage extends StatefulWidget {
  const AddNewCardPage({super.key});

  @override
  State<AddNewCardPage> createState() => _AddNewCardPageState();
}

class _AddNewCardPageState extends State<AddNewCardPage> {
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
          'Add New Card',
          style: TextStyle(fontSize: 25.sp),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(IconlyLight.more_circle),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 25, right: 25, top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/profile/Mocard.png'),
              SizedBox(
                height: 25.h,
              ),
              Text(
                'Card Name',
                style: TextStyle(fontSize: 18.sp),
              ),
              SizedBox(
                height: 12.h,
              ),
              const TextFiledWidget1(
                text: 'Card Name',
                obscureText: false,
              ),
              SizedBox(
                height: 25.h,
              ),
              Text(
                'Card Number',
                style: TextStyle(fontSize: 18.sp),
              ),
              SizedBox(
                height: 12.h,
              ),
              const TextFieldWidget(
                text: '**** **** **** ****',
              ),
              Row(
                children: [
                  Text(
                    'Expiry Date',
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  SizedBox(
                    width: 110.w,
                  ),
                  Text(
                    'CVV',
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ],
              ),
              SizedBox(height: 15.h,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   SizedBox(height:56,width: 180.w, child: const DateOfBirthPicker()),
                  SizedBox(width: 15.w,),
                   Expanded(child: SizedBox(width:180.w,child: TextFiledWidget1(text: 'CVV', obscureText: false)))
                ],
              ),
              SizedBox(height: 20.h,),
              LogInElevated(onPressed: (){}, text: 'Add New Card')
            ],
          ),
        ),
      ),
    );
  }
}
