import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:portfolio1/features/auth/presentation/widgets/eleveted_widgets.dart';

class SetFingerprintPage extends StatefulWidget {
  const SetFingerprintPage({super.key});

  @override
  State<SetFingerprintPage> createState() => _SetFingerprintPageState();
}

class _SetFingerprintPageState extends State<SetFingerprintPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Set Your Fingerprint",
          style: TextStyle(fontSize: 24),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Add a fingerprint to make your account\n                     more secure.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 40,
              ),
              Image.asset('assets/profile/scanner.png'),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Please put your finger on the fingerprint\n            scanner to get started.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 184.w,
                      height: 58.h,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffEBEFFE),
                          minimumSize: const Size(double.infinity, 49),
                        ),
                        child: const Text('Skip'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 184.w,
                      height: 58.h,
                      child: LogInElevated(
                          onPressed: () {
                            showSuccessDialog(context);
                          },
                          text: 'Continue'),
                    ),
                  ),
                ],
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
                   Image.asset('assets/profile/person_image.png')
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
