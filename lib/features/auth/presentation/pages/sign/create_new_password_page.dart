import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:portfolio1/core/route/route_names.dart';
import '../../widgets/eleveted_widgets.dart';
import '../../widgets/text_filed_widget1.dart';

class CreateNewPasswordPage extends StatefulWidget {
  const CreateNewPasswordPage({super.key});

  @override
  State<CreateNewPasswordPage> createState() => _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends State<CreateNewPasswordPage> {
  bool eye = true;
  bool card = true;

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
        backgroundColor: Colors.white,
        title: const Text(
          'Create New Password',
          style: TextStyle(fontSize: 25),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 70,
              ),
              Image.asset('assets/sign/Frame_new_password.png'),
              const SizedBox(
                height: 70,
              ),
              const Text(
                "Create Your New Password",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFiledWidget1(
                text: 'New Password',
                obscureText: eye,
                prefixIcon: const Icon(
                  IconlyLight.lock,
                  color: Colors.black,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      eye = !eye;
                    });
                  },
                  icon: Icon(eye ? IconlyLight.hide : IconlyLight.show),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFiledWidget1(
                text: 'Reaped Password',
                obscureText: eye,
                prefixIcon: const Icon(
                  IconlyLight.lock,
                  color: Colors.black,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      eye = !eye;
                    });
                  },
                  icon: Icon(eye ? IconlyLight.hide : IconlyLight.show),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          card = !card;
                        });
                      },
                      child: card
                          ? Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          border: Border.all(
                            color: Color(0xff335EF7),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      )
                          : Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage(
                                  'assets/sign/galichka.png')),
                          border: Border.all(
                            color: Color(0xff335EF7),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text("Remember me"),
                    const SizedBox(
                      height: 80,
                    ),

                  ],
                ),
              ),
              LogInElevated(onPressed: (){showSuccessDialog(context);}, text: 'Continue'),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 3), (){
          Navigator.pushNamed(context, RouteNames.bottom_Navbar);
        });
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/sign/Congratulations.png')
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Congratulations!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Your account is ready to use. You will be redirected to the Home page in a few seconds..",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 20),

                // Loading animation
                const SizedBox(
                  height: 60,
                  width: 60,
                  child: LoadingIndicator(
                    indicatorType: Indicator.ballSpinFadeLoader,
                    colors: [Colors.blue],
                    strokeWidth: 7,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
