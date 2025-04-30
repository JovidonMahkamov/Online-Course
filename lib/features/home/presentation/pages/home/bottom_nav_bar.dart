import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:portfolio1/features/home/presentation/pages/Transaction/transaction_page.dart';
import 'package:portfolio1/features/home/presentation/pages/chat/chat_page.dart';
import 'package:portfolio1/features/home/presentation/pages/profil/profil_page.dart';
import '../my_course/my_course_page.dart';
import 'home_page.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  @override
  int _currentIndex = 0;
  List<Widget> pages =  [
    HomePage(),
    MyCoursePage(),
    ChatPage(),
    TransactionPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: pages[_currentIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey[600],
          selectedItemColor: Colors.blueAccent,
          currentIndex: _currentIndex,
          selectedLabelStyle:
          const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          items: [
            BottomNavigationBarItemWidget("Home", const Icon(IconlyLight.home)),
            BottomNavigationBarItemWidget( "My Course", const Icon(IconlyLight.document),),
            BottomNavigationBarItemWidget("Inbox", const Icon(IconlyLight.chat)),
            BottomNavigationBarItemWidget("Transaction", const Icon(IconlyLight.buy)),
            BottomNavigationBarItemWidget("Profile", const Icon(IconlyLight.profile)),
          ],
        ));
  }
}

BottomNavigationBarItem BottomNavigationBarItemWidget(
    String label, Icon icon) {
  return BottomNavigationBarItem(
    backgroundColor: Colors.white,
    label: label,
    icon: icon
  );
}
