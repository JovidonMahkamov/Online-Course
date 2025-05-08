import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:portfolio1/core/route/route_names.dart';
import 'package:portfolio1/features/auth/presentation/widgets/buildpinbox_widgex_page.dart';
import 'package:portfolio1/features/auth/presentation/widgets/eleveted_widgets.dart';

import '../../bloc/auth_event.dart';
import '../../bloc/confirm_email/confirm_email_bloc.dart';
import '../../bloc/confirm_email/confirm_email_state.dart';

class ForgotPasswordTypeOtpPage extends StatefulWidget {
  final int userId;
  final String emailOrPhone;

  ForgotPasswordTypeOtpPage(
      {super.key, required this.userId, required this.emailOrPhone});

  @override
  State<ForgotPasswordTypeOtpPage> createState() => _ForgotPasswordTypeOtpPageState();
}

class _ForgotPasswordTypeOtpPageState extends State<ForgotPasswordTypeOtpPage> {
  TextEditingController codeController = TextEditingController();

  void _confirmNewCode() {
    final int code = int.parse(codeController.text.trim());

    context.read<ConfirmEmailBloc>().add(
          ConfirmEmail(
            userId: widget.userId,
            code: int.tryParse(code.toString()) ?? 0,
            isResetPassword: true,
          ),
        );
    print("userId: ${widget.userId}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Forgot Password",
          style: TextStyle(fontSize: 25),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
               Text(
                "Code has been send to ${widget.emailOrPhone}",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 80,
              ),
              const BuildpinboxWidgexPage(),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Resend code in 55 s",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 200,
              ),
              BlocConsumer<ConfirmEmailBloc, ConfirmEmailState>(
                listener: (context, state) {
                  if (state is ConfirmEmailSuccess) {
                    Navigator.pushNamed(context, RouteNames.createNewPassword,
                      arguments: state.token.accessToken,
                    );
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
                      text: "Verify",
                      onPressed: _confirmNewCode,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
