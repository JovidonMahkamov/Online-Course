import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:portfolio1/core/route/route_names.dart';
import 'package:portfolio1/features/auth/presentation/pages/sign/sign_in_page.dart';
import '../../bloc/auth_event.dart';
import '../../bloc/reset_new_password/reset_new_password_state.dart';
import '../../bloc/reset_new_password/resset_new_password_bloc.dart';
import '../../widgets/eleveted_widgets.dart';
import '../../widgets/text_filed_widget1.dart';

class CreateNewPasswordPage extends StatefulWidget {
  final String token;
  const CreateNewPasswordPage({super.key, required this.token});

  @override
  State<CreateNewPasswordPage> createState() => _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends State<CreateNewPasswordPage> {

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPassword = TextEditingController();
  bool eye = true;
  bool card = true;
  void newPassword() {
    String password = _passwordController.text.trim();
    String repeatPassword = _repeatPassword.text.trim();

    if (password.isEmpty || repeatPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill in all fields"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (password != repeatPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Passwords do not match"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    BlocProvider.of<ResetNewPasswordBloc>(
      context,
    ).add(ResetNewPasswordEvent(newPassword: password, token: widget.token));
  }


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
                textEditingController: _passwordController,
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
                textEditingController: _repeatPassword,
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
              BlocConsumer<ResetNewPasswordBloc, ResetNewPasswordState>(
                listener: (context, state) {
                  if (state is ResetNewPasswordSuccess) {
                    showSuccessDialog(context, SignInPage());
                  } else if (state is ResetNewPasswordError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is ResetNewPasswordLoading) {
                    return const Center(
                      child: SizedBox(
                        width: 60,
                        height: 60,
                        child: LoadingIndicator(
                          indicatorType: Indicator.ballSpinFadeLoader,
                          colors: [Colors.blueAccent],
                          strokeWidth: 2,
                        ),
                      ),
                    );
                  } else {
                    return LogInElevated(
                      text: "Continue",
                      onPressed: newPassword,
                    );
                  }
                },
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
  void showSuccessDialog(BuildContext context, Widget page) {
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
