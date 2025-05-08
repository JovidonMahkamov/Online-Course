import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:portfolio1/core/route/route_names.dart';
import 'package:portfolio1/features/auth/presentation/widgets/eleveted_widgets.dart';
import '../../../../../core/di/services.dart';
import '../../../../../core/untils/logger.dart';
import '../../../data/datasource/local/auth_local_data_cource.dart';
import '../../bloc/auth_event.dart';
import '../../bloc/confirm_email/confirm_email_bloc.dart';
import '../../bloc/confirm_email/confirm_email_state.dart';

class SignUpConfirmEmailOrPassword extends StatefulWidget {
  final String emailOrPhone;
  final String password;
  final int userId;

  const SignUpConfirmEmailOrPassword({
    super.key,
    required this.userId,
    required this.emailOrPhone,
    required this.password,
  });

  @override
  State<SignUpConfirmEmailOrPassword> createState() =>
      _SignUpConfirmEmailOrPasswordState();
}

class _SignUpConfirmEmailOrPasswordState extends State<SignUpConfirmEmailOrPassword> {
  final authLocalDataSource = sl<AuthLocalDataSource>();

  List<TextEditingController> controllers = List.generate(
    4,
        (_) => TextEditingController(),
  );
  List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onKeyPress(String value, int index) {
    if (value.isNotEmpty && index < 3) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    }
  }

  void _onBackspace(int index) {
    if (index > 0 && controllers[index].text.isEmpty) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }
  }

  void confirmEmail() {
    final code = controllers.map((c) => c.text).join();

    if (code.length == 4) {
      context.read<ConfirmEmailBloc>().add(
        ConfirmEmail(
          userId: widget.userId,
          code: int.tryParse(code) ?? 0,
          isResetPassword: false,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter all 4 digits'),
          backgroundColor: Colors.red,
        ),
      );
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Confirm Email or Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 80,
          children: [
            Text(
              'Code has been send to ${widget.emailOrPhone}',
              textAlign: TextAlign.center,
              // style: AppTextStyles.urbanist.regular(
              //   color: AppColors.greyScale.grey900,
              //   fontSize: 18,
              // ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) {
                return Container(
                  width: 83.w,
                  height: 63.h,
                  decoration: BoxDecoration(
                    color:
                    focusNodes[index].hasFocus
                        ? Colors.blue
                        : Colors.grey[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color:
                      focusNodes[index].hasFocus
                          ? Colors.blue
                          : Colors.grey,
                      width: 1,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: TextField(
                    controller: controllers[index],
                    focusNode: focusNodes[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    // style: AppTextStyles.urbanist.bold(
                    //   color: AppColors.greyScale.grey900,
                    //   fontSize: 24,
                    // ),
                    decoration: const InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _onKeyPress(value, index);
                        _onBackspace(index);
                      });
                    },
                  ),
                );
              }),
            ),
            Text(
              'Resend code in 55 s',
              textAlign: TextAlign.center,
              // style: AppTextStyles.urbanist.regular(
              //   color: AppColors.greyScale.grey900,
              //   fontSize: 18,
              // ),
            ),
            BlocConsumer<ConfirmEmailBloc, ConfirmEmailState>(
              listener: (context, state) {
                if (state is ConfirmEmailSuccess) {
                  saveRememberMe(widget.emailOrPhone, widget.password);
                  saveAuthToken(
                    state.token.accessToken,
                    state.token.refreshToken,
                  );
                  Navigator.pushReplacementNamed(context, RouteNames.bottom_Navbar);
                } else if (state is ConfirmEmailFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.error),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is ConfirmEmailLoading) {
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
                    onPressed: confirmEmail,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
