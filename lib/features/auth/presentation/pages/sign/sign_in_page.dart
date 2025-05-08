import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:portfolio1/features/auth/presentation/widgets/text_filed_widget1.dart';

import '../../../../../core/di/services.dart';
import '../../../../../core/route/route_names.dart';
import '../../../../../core/untils/logger.dart';
import '../../../data/datasource/local/auth_local_data_cource.dart';
import '../../bloc/auth_event.dart';
import '../../bloc/log_in_user/log_in_user_bloc.dart';
import '../../bloc/log_in_user/log_in_user_state.dart';
import '../../widgets/eleveted_widgets.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final authLocalDataSource = sl<AuthLocalDataSource>();


  bool eye = true;

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void signInUser() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill in all fields"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    BlocProvider.of<LogInUserBloc>(
      context,
    ).add(LoginUser(email: email, password: password));
  }
  void saveRememberMe(String email, String password) {
    authLocalDataSource
        .saveRememberMe(email, password)
        .then((_) {
      LoggerService.info("Remember Me saved : $email - $password");
    })
        .catchError((error) {
      LoggerService.error("Error saving Remember Me: $error");
    });
  }

  void saveAuthToken(String accessToken, String refreshToken) {
    authLocalDataSource
        .saveAuthToken(refreshToken, accessToken)
        .then((_) {
      LoggerService.info("Auth Token saved : $accessToken - $refreshToken");
    })
        .catchError((error) {
      LoggerService.error("Error saving Auth Token: $error");
    });
  }
  bool card = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Login to your\nAccount",
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFiledWidget1(
                  text: 'Email',
                  prefixIcon: const Icon(
                    IconlyLight.message,
                    color: Colors.grey,
                  ),
                  textEditingController: emailController, obscureText: false,
                ),
                const SizedBox(
                  height: 10,
                ),TextFiledWidget1(
                  text: 'Password',
                  prefixIcon: const Icon(
                    IconlyLight.lock,
                    color: Colors.grey,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {setState(() {
                      eye =! eye;
                    });}, icon:  Icon(eye? IconlyLight.hide:IconlyLight.show),),textEditingController: passwordController, obscureText: eye,
                ),
                 SizedBox(
                  height: 20.h,
                ),
                BlocConsumer<LogInUserBloc, LogInUserState>(
                  listener: (context, state) {
                    if (state is LogInUserSuccess) {
                      saveRememberMe(
                        emailController.text,
                        passwordController.text,
                      );
                      saveAuthToken(state.user.accessToken, state.user.refreshToken);
                      Navigator.pushReplacementNamed(context, RouteNames.bottom_Navbar);
                    } else if (state is LogInUserError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is LogInUserLoading) {
                      return const Center(
                        child: SizedBox(
                          width: 60,
                          height: 60,
                          child: LoadingIndicator(
                            indicatorType: Indicator.ballSpinFadeLoader,
                            colors: [Colors.blueAccent],
                            strokeWidth: 2,
                          ),
                        ),);
                    } else {
                      return LogInElevated(
                        text: "Sign In",
                        onPressed: signInUser,
                      );
                    }
                  },
                ),

                 SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.forgotPassword);
                    },
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.blueAccent,
                        textStyle:  TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    child: const Text("Forgot the password"),
                  ),
                ),
                 SizedBox(
                  height: 40.h,
                ),
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
                        'or continue with',
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
                 SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSignUpCard(iconUrl: 'assets/sign/Facebook.png'),
                      _buildSignUpCard(iconUrl: 'assets/sign/Google.png'),
                      _buildSignUpCard(iconUrl: 'assets/sign/Apple.png'),
                    ],
                  ),
                ),
                 SizedBox(height: 20.h,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Colors.black26),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RouteNames.signUpPage);
                        },
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.blueAccent,
                            textStyle:  TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.bold)),
                        child: const Text("Sign Up"),
                      ),
                    ])
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpCard({required String iconUrl}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
        ],
      ),
    );
  }
}
