import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:portfolio1/features/auth/presentation/widgets/eleveted_widgets.dart';

import '../../../../../core/route/route_names.dart';
import '../../bloc/auth_event.dart';
import '../../bloc/register_user/sign_up_in_bloc.dart';
import '../../bloc/register_user/sign_up_in_state.dart';
import '../../widgets/text_filed_widget1.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  bool _obscureText = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode.addListener(() => setState(() {}));
    _confirmPasswordFocusNode.addListener(() => setState(() {}));
    _emailFocusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _emailController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  bool _isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  String? _validateForm() {
    if (_emailController.text.isEmpty) {
      return 'Please enter your email';
    }
    if (!_isEmailValid(_emailController.text)) {
      return 'Please enter a valid email';
    }
    if (_passwordController.text.isEmpty) {
      return 'Please enter your password';
    }
    if (_passwordController.text.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    if (_confirmPasswordController.text.isEmpty) {
      return 'Please confirm your password';
    }
    if (_passwordController.text != _confirmPasswordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void _handleSignUp() {
    final validationError = _validateForm();
    if (validationError != null) {
      setState(() {
        _errorMessage = validationError;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(validationError),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    setState(() {
      _errorMessage = null;
    });

    context.read<RegisterUserBloc>().add(
      RegisterUser(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.letsInPage);
                  },
                  icon: Icon(Icons.arrow_back, size: 28),
                ),
                const SizedBox(height: 30),
                Text(
                  'Create your\nAccount',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 48.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 40),
                Column(
                  spacing: 20,
                  children: [
                    TextFiledWidget1(
                      text: 'email',
                      textEditingController: _emailController,
                      prefixIcon: Icon(IconlyBold.message,color: Colors.grey,),
                      obscureText: false,
                    ),
                    TextFiledWidget1(
                      obscureText: _obscureText,
                      text: 'Password',
                      textEditingController: _passwordController,
                      prefixIcon: Icon(IconlyBold.lock,color: Colors.grey,),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: Icon(
                          _obscureText ? IconlyLight.hide : IconlyLight.show,
                        ),
                      ),
                    ),
                    TextFiledWidget1(
                      obscureText: _obscureText,
                      text: 'Confirm Password',
                      textEditingController: _confirmPasswordController,
                      prefixIcon: Icon(IconlyBold.lock,color: Colors.grey,),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: Icon(
                          _obscureText ? IconlyLight.hide : IconlyLight.show,
                        ),
                      ),
                    ),
                  ],
                ),
                BlocConsumer<RegisterUserBloc, RegisterUserState>(
                  listener: (context, state) {
                    if (state is RegisterUserSuccess) {
                      Navigator.pushNamed(
                        context,
                        RouteNames.createNewPinPage,
                        arguments: state.registerEntity.userId,
                      );
                    } else if (state is RegisterUserError) {
                      print('Error state: ${state.error}');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.error),
                          backgroundColor: Colors.red,
                        ),
                      );
                      setState(() {
                        _errorMessage = state.error;
                      });
                    }
                  },
                  builder: (context, state) {
                    if (state is RegisterUserLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    else {
                      return LogInElevated(
                        text: 'signUp',
                        onPressed: _handleSignUp,
                      );
                    }
                  },
                ),
                SizedBox(height: 48.h),
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text("or continue with"),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.only(left: 40, right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSignUpCard(imgUrl: 'assets/sign/Facebook.png'),
                      SizedBox(width: 20.w),
                      _buildSignUpCard(imgUrl: 'assets/sign/Google.png'),
                      SizedBox(width: 20.w),
                      _buildSignUpCard(imgUrl: 'assets/sign/Apple.png'),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.signInPage);
                      },
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpCard({required String imgUrl}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 16.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(children: [Image.asset(imgUrl, width: 24, height: 24)]),
    );
  }
}