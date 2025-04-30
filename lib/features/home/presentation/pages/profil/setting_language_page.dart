import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/profile_widgets/language_widget.dart';

class SettingLanguagePage extends StatefulWidget {
  const SettingLanguagePage({super.key});

  @override
  State<SettingLanguagePage> createState() => _SettingLanguagePageState();
}

class _SettingLanguagePageState extends State<SettingLanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          'Language',
          style: TextStyle(fontSize: 25.sp),
        ),
      ),
      body:  Padding(
        padding: EdgeInsets.only(left: 25, right: 25, top: 25),
        child: Column(
          children: [
            Text(
              'Suggested',
              style: TextStyle(fontSize: 20),
            ),
            // LanguageWidget(index: null,)
          ],
        ),
      ),
    );
  }
}
