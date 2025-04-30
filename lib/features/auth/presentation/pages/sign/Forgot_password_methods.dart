import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:portfolio1/features/auth/presentation/widgets/eleveted_widgets.dart';

import '../../../../../core/route/route_names.dart';
import '../../bloc/auth_event.dart';
import '../../bloc/reset_password/reset_password_bloc.dart';
import '../../bloc/reset_password/reset_password_state.dart';
import '../../widgets/text_filed_widget1.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();

  void resetPassword() {
    context.read<ResetPasswordBloc>().add(
      ResetPasswordEvent(
        emailOrPhone: _emailController.text.trim(),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Forgot Password",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 24.h,),
            Center(child: Image.asset("assets/images/forgor_password1.png")),
            SizedBox(height: 22.h,),
            Text(
              "Select which contact details should we use to reset your password.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 22.h,),
            TextFiledWidget1(
              text: 'Email',
              textEditingController: _emailController,
              prefixIcon: Icon(IconlyBold.message),
              obscureText: false,
            ),
            SizedBox(height: 28.h,),
            BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
              listener: (context, state) {
                if (state is ResetPasswordSuccess) {
                  Navigator.pushNamed(context, RouteNames.forgotPasswordTypeOtpPage,
                      arguments: state.response.userId);
                } else if (state is ResetPasswordError) {
                  print('Error state: ${state.message}');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is ResetPasswordLoading) {
                  return CircularProgressIndicator();
                }
                return LogInElevated(
                  text: "Continue",
                  onPressed: () {
                    resetPassword();
                  },
                );
              },
            ),
          ],
        ),
      ),

    );
  }
}