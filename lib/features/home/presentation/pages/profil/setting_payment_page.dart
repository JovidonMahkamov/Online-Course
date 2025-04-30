import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:portfolio1/core/route/route_names.dart';
import 'package:portfolio1/features/auth/presentation/widgets/eleveted_widgets.dart';

import '../../widgets/profile_widgets/setting_payment_widget.dart';

class SettingPaymentPage extends StatefulWidget {
  const SettingPaymentPage({super.key});

  @override
  State<SettingPaymentPage> createState() => _SettingPaymentPageState();
}

class _SettingPaymentPageState extends State<SettingPaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          'Payment',
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
          padding: EdgeInsets.only(top: 25, left: 25, right: 25),
          child: Column(
            children: [
              const SettingPaymentWidget(
                image: 'assets/profile/payment.png',
                text: 'PayPal',
              ),
              SizedBox(
                height: 25.h,
              ),
              const SettingPaymentWidget(
                image: 'assets/sign/Google.png',
                text: 'Google Pay',
              ),
              SizedBox(
                height: 25.h,
              ),
              const SettingPaymentWidget(
                image: 'assets/sign/Apple.png',
                text: 'Apple Pay',
              ),
              SizedBox(
                height: 25.h,
              ),
              const SettingPaymentWidget(
                image: 'assets/profile/mastercard.png',
                text: '**** **** **** **** 4679',
              ),
              SizedBox(
                height: 250.h,
              ),
              LogInElevated(onPressed: (){Navigator.pushNamed(context, RouteNames.addNewCard);}, text: 'Add NewCard'),
            ],
          ),
        ),
      ),
    );
  }
}
