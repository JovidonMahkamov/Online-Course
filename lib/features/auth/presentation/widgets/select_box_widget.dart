import 'package:flutter/material.dart';
import 'package:portfolio1/core/route/route_names.dart';

class SelectBoxWidget extends StatefulWidget {
  const SelectBoxWidget({super.key});

  @override
  State<SelectBoxWidget> createState() => _SelectBoxWidgetState();
}

class _SelectBoxWidgetState extends State<SelectBoxWidget> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildOptionBox(0, AssetImage('assets/sign/Auto_forgot_number.png'),
            'via SMS:', '+1 111 ******99'),
        const SizedBox(height: 16),
        _buildOptionBox(1, AssetImage('assets/sign/Auto_forgot_email.png'),
            'via Email:', 'and***ley@yourdomain.com'),
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: selectedIndex != null
              ? () {
                  Navigator.pushNamed(context, RouteNames.forgotPasswordTypeOtpPage);
                }
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor:
                selectedIndex != null ? Colors.blue : Colors.grey.shade300,
            foregroundColor: selectedIndex != null ? Colors.white : Colors.grey,
            minimumSize: const Size(double.infinity, 50),
          ),
          child: const Text("Continue"),
        ),
      ],
    );
  }

  Widget _buildOptionBox(int index, ImageProvider image, String text, String text1) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        height: 128,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 15,
            ),
            CircleAvatar(
              backgroundImage: image,
              radius: 40,
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
                ),
                Text(
                  text1,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
