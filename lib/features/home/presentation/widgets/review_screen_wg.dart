import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'custom_choise_chip_wg.dart';


class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  _ReviewsScreenState createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  final List<Map<String, dynamic>> reviews = [
    {
      'name': 'Marielle Wigington',
      'rating': 5,
      'comment':
      'The course is very good, the explanation of the mentor is very clear and easy to understand! 😍😍',
      'likes': 948,
      'date': '2 weeks ago',
      'avatar': 'assets/home/mentor_avatar.png',
    },
    {
      'name': 'Marielle Wigington',
      'rating': 4,
      'comment':
      'The course is very good, the explanation of the mentor is very clear and easy to understand! 😍😍',
      'likes': 948,
      'date': '2 weeks ago',
      'avatar': 'assets/home/mentor_avatar.png',
    },
    {
      'name': 'Marielle Wigington',
      'rating': 4,
      'comment':
      'The course is very good, the explanation of the mentor is very clear and easy to understand! 😍😍',
      'likes': 948,
      'date': '2 weeks ago',
      'avatar': 'assets/home/mentor_avatar.png',
    },
    {
      'name': 'Marielle Wigington',
      'rating': 5,
      'comment':
      'The course is very good, the explanation of the mentor is very clear and easy to understand! 😍😍',
      'likes': 948,
      'date': '2 weeks ago',
      'avatar': 'assets/home/mentor_avatar.png',
    },
    {
      'name': 'Marielle Wigington',
      'rating': 5,
      'comment':
      'The course is very good, the explanation of the mentor is very clear and easy to understand! 😍😍',
      'likes': 948,
      'date': '2 weeks ago',
      'avatar': 'assets/home/mentor_avatar.png',
    },
    {
      'name': 'Marielle Wigington',
      'rating': 5,
      'comment':
      'The course is very good, the explanation of the mentor is very clear and easy to understand! 😍😍',
      'likes': 948,
      'date': '2 weeks ago',
      'avatar': 'assets/home/mentor_avatar.png',
    },
    {
      'name': 'Marielle Wigington',
      'rating': 5,
      'comment':
      'The course is very good, the explanation of the mentor is very clear and easy to understand! 😍😍',
      'likes': 948,
      'date': '2 weeks ago',
      'avatar': 'assets/home/mentor_avatar.png',
    },
    // Add more reviews as needed
  ];
  int selectedRatingIndex = 0;


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final List<String> optionsRating = ['All', '5', '4', '3', '2', '1'];
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Rating Summary
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(IconlyBold.star, color: Colors.amber),
                  const SizedBox(width: 10),
                  Text(
                    '4.8 (4,479 reviews)',
                    style: TextStyle(
                      fontSize: 20,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                child: Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          //! Rating check bar
          SizedBox(
            height: (40),
            child: ListView.builder(
              itemCount: optionsRating.length,
              scrollDirection: Axis.horizontal,
              itemBuilder:
                  (context, index) => CustomChoiceChipWg(
                showIcon: true,
                index: index,
                label: optionsRating[index],
                selectedIndex: selectedRatingIndex,
                onSelected: (selected) {
                  setState(() {
                    selectedRatingIndex =
                    selected ? index : selectedRatingIndex;
                  });
                },
              ),
            ),
          ),
          //! Rating check bar
          SizedBox(height: 16),

          // Reviews List
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: reviews.length,
            itemBuilder: (context, index) {
              return _buildReviewCard(reviews[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildReviewCard(Map<String, dynamic> review) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(review['avatar']),
                    radius: 20,
                  ),
                  SizedBox(width: 16),
                  Text(
                    review['name'],
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star, color: Colors.blue, size: 16),
                    SizedBox(width: 4),
                    Text(
                      review['rating'].toString(),
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            review['comment'],
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Row(
                children: [
                  Icon(IconlyBold.heart, color: Colors.red, size: 20),
                  SizedBox(width: 4),
                  Text(
                    '${review['likes']}',
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Text(
                review['date'],
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
