import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:portfolio1/features/auth/presentation/widgets/text_filed_widget1.dart';

import '../../../../../core/route/route_names.dart';
import '../../bloc/auth_event.dart';
import '../../bloc/register_user/sign_up_in_bloc.dart';
import '../../bloc/register_user/sign_up_in_state.dart';
import '../../widgets/eleveted_widgets.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();

  bool eye = true;

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    passwordController.dispose();
    _emailFocusNode.dispose();
    emailController.dispose();
    super.dispose();
  }

  void signIn() {
    context.read<RegisterUserBloc>().add(
      RegisterUser(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
    );
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
                      const Text("Remember me")
                    ],
                  ),
                ),
                 SizedBox(
                  height: 20.h,
                ),
                BlocConsumer<RegisterUserBloc, RegisterUserState>(
                  listener: (context, state) {
                    if (state is RegisterUserSuccess) {
                      Navigator.pushNamed(context, RouteNames.homePage);
                    } else if (state is RegisterUserError) {
                      print('Error state: ${state.error}');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.error),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is RegisterUserLoading) {
                      return CircularProgressIndicator();
                    }
                    return LogInElevated(
                      text: "Sign in",
                      onPressed: () {
                        signIn();
                      },
                    );
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
