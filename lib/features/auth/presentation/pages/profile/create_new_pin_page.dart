import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio1/core/route/route_names.dart';
import 'package:portfolio1/features/auth/presentation/widgets/buildpinbox_widgex_page.dart';
import 'package:portfolio1/features/auth/presentation/widgets/eleveted_widgets.dart';

import '../../bloc/auth_event.dart';
import '../../bloc/confirm_email/confirm_email_bloc.dart';
import '../../bloc/confirm_email/confirm_email_state.dart';

class CreateNewPinPage extends StatefulWidget {
  final int userId;
  CreateNewPinPage({required this.userId});
  @override
  State<CreateNewPinPage> createState() => _CreateNewPinPageState();
}

class _CreateNewPinPageState extends State<CreateNewPinPage> {
  final TextEditingController codeController = TextEditingController();

  void _confirmCode() {
    context.read<ConfirmEmailBloc>().add(
      ConfirmEmail(userId: widget.userId, code: int.parse(codeController.text.trim()), isResetPassword: false),
    );
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Create New PIN",
          style: TextStyle(fontSize: 25),
        ),
        leading: IconButton(onPressed: () {Navigator.pop(context);}, icon: const Icon(Icons.arrow_back)),
      ),
      body:  Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "Add a PIN number to make your account\n                       more secure.",
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 80,),
            BuildpinboxWidgexPage(),
            const SizedBox(height: 80,),
            BlocConsumer<ConfirmEmailBloc, ConfirmEmailState>(
              listener: (context, state) {
                if (state is ConfirmEmailSuccess) {
                  Navigator.pushNamed(context, RouteNames.homePage);
                } else if (state is ConfirmEmailFailure) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.error)));
                }
              },
              builder: (context, state) {
                if (state is ConfirmEmailLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                return LogInElevated(text: "Continue", onPressed: _confirmCode);
              },
            ),
          ],
        ),
      ),
    );
  }
}
