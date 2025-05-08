import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../widgets/chats_wg.dart';
import '../../../widgets/course_card_wg.dart';
import '../../../widgets/review_screen_wg.dart';

class MentorProfilePage extends StatefulWidget {
  const MentorProfilePage({super.key});

  @override
  State<MentorProfilePage> createState() => _MentorProfilePageState();
}

class _MentorProfilePageState extends State<MentorProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            IconlyLight.arrow_left,
            color: isDarkMode ? Colors.white : Colors.black,
            size: 28,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              IconlyLight.more_circle,
              color: isDarkMode ? Colors.white : Colors.black,
              size: 28,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Profile Header
          Container(
            padding: EdgeInsets.all(16.0),
            color: isDarkMode ? Colors.black : Colors.white,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    'assets/images/mentor_avatar.png',
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Jonathan Williams',
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'Senior UI/UX Designer at Google',
                  style: TextStyle(
                    color:
                    isDarkMode
                        ? Colors.grey[600]
                        : Colors.black,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStat('25', 'Courses'),
                    _buildStat('22,379', 'Students'),
                    _buildStat('9,287', 'Reviews'),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.message, color: Colors.white),
                      label: Text(
                        'Message',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.language, color: Colors.blue),
                      label: Text(
                        'Website',
                        style: TextStyle(color: Colors.blue),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.blue, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // TabBar
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'Courses'),
              Tab(text: 'Students'),
              Tab(text: 'Reviews'),
            ],
          ),
          // TabBarView
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: (16)),
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return CourseCard(
                        onTap: () {
                          // context.pushNamed(RouteNames.courseDetails)
                          // Navigator.pushNamed(
                          //   context,
                          //   RouteNames.courseDetails,
                          // );
                        },
                        imagePath: 'assets/images/Rectangle2.png',
                        category: 'Entrepreneurship',
                        title: 'Digital Entrepren eur...',
                        price: 39,
                        oldPrice: 80,
                        rating: 4.8,
                        students: 8289,
                        onBookmarkPressed: () {},
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: 15,
                    itemBuilder: (BuildContext context, int index) {
                      return ChatsWidget(
                        imagePath: 'assets/images/boy.png',
                        name: 'Mentor',
                        jobTitle: 'Specialist in Field',
                      );
                    },
                  ),
                  ReviewsScreen(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(label),
      ],
    );
  }
}
