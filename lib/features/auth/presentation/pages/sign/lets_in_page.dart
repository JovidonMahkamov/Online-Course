import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/route/route_names.dart';
import '../../widgets/eleveted_widgets.dart';

class LetsIn extends StatefulWidget {
  const LetsIn({super.key});

  @override
  State<LetsIn> createState() => _LetsInState();
}

class _LetsInState extends State<LetsIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading:
            IconButton(onPressed: () {Navigator.pop(context);}, icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height:220.h,width: 400.w, child: Image.asset("assets/sign/Frame_girl3.png")),
               SizedBox(height: 30.h,),
               Text("Let’s you in",style: TextStyle(fontSize: 48.sp,fontWeight: FontWeight.bold),),
               SizedBox(height: 30.w,),
              Column(
                children: [
                  _buildSignUpCard(
                    iconUrl: 'assets/sign/Facebook.png',
                    text: 'Continue with Facebook',
                  ),
                  _buildSignUpCard(
                    iconUrl: 'assets/sign/Google.png',
                    text: 'Continue with Google',
                  ),
                  _buildSignUpCard(
                    iconUrl: 'assets/sign/Apple.png',
                    text: 'Continue with Apple',
                  ),
                  SizedBox(height: 35.h,),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'or',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 35.h,),
                  LogInElevated(onPressed: (){Navigator.pushNamed(context, RouteNames.signInPage);}, text: 'Sign in with password'),
                  SizedBox(height: 25.h,),
                  Row(children: [
                    const Text("Don't have an account? ",style: TextStyle(color: Colors.black26),),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RouteNames.signUpPage);
                      },
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.blueAccent,
                          textStyle:  TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold)),
                      child: const Text("Sign Up"),
                    ),
                  ])
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildSignUpCard({required String iconUrl, required String text}) {
    return Container(
      margin: EdgeInsets.symmetric( vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(
            iconUrl,
            width: 24.w,
            height: 24.h,
          ),
          SizedBox(width: 12),
          Text(
            text,
            style: TextStyle(fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
