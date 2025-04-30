import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:portfolio1/core/route/route_names.dart';
import 'package:portfolio1/features/auth/presentation/widgets/date_of_birth_piker.dart';
import 'package:portfolio1/features/auth/presentation/widgets/eleveted_widgets.dart';
import 'package:portfolio1/features/auth/presentation/widgets/gender_selection.dart';
import 'package:portfolio1/features/auth/presentation/widgets/text_filed_widget1.dart';

class ProfileBlankPage extends StatefulWidget {
  const ProfileBlankPage({super.key});

  @override
  _ProfileBlankPageState createState() => _ProfileBlankPageState();
}

class _ProfileBlankPageState extends State<ProfileBlankPage> {
  File? _imageFile;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fill Your Profile',
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.signInPage);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: _imageFile != null
                          ? FileImage(_imageFile!)
                          : const AssetImage('assets/profile/avatar_person.png')
                              as ImageProvider,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              // color: Colors.blue,
                            ),
                            child: Image.asset('assets/profile/pen_icon.png')),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextFiledWidget1(
                  text: 'Full Name',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextFiledWidget1(
                  text: 'Nickname ',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                DateOfBirthPicker(),
                const SizedBox(
                  height: 25,
                ),
                TextFiledWidget1(
                  text: 'Email ',
                  obscureText: false,
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        IconlyLight.message,
                        color: Colors.grey,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextFiledWidget1(
                  text: 'Phone Number ',
                  obscureText: false,
                  prefixIcon: Icon(
                    IconlyLight.arrow_down_2,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const GenderSelection(),
                const SizedBox(
                  height: 30,
                ),
                LogInElevated(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.createNewPinPage);
                    },
                    text: 'Continue'),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
