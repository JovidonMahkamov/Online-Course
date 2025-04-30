import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../auth/presentation/widgets/text_filed_widget1.dart';

class HomeSearchTypeKeywordPage extends StatefulWidget {
  const HomeSearchTypeKeywordPage({super.key});

  @override
  State<HomeSearchTypeKeywordPage> createState() => _HomeSearchTypeKeywordPageState();
}

class _HomeSearchTypeKeywordPageState extends State<HomeSearchTypeKeywordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30,left: 25,right: 25),
          child: Column(children: [
            TextFiledWidget1(
              text: 'Search',
              obscureText: false,
              prefixIcon: const Icon(IconlyLight.search),
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    IconlyLight.filter,
                    color: Colors.blueAccent,
                  )),
            ),
          ],),
        ),
      ),
    );
  }
}
