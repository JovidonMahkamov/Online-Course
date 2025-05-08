import 'package:flutter/material.dart';
import 'package:portfolio1/core/route/route_names.dart';
import '../../../../domain/entities/search_response.dart';
import '../../../widgets/chats_wg.dart';
import '../../../widgets/course_card_wg.dart';
import 'not_found_body.dart';

class SearchResultBody extends StatefulWidget {
  final SearchResponse searchResponse;
  final String query;

  const SearchResultBody({
    super.key,
    required this.query,
    required this.searchResponse,
  });

  @override
  State<SearchResultBody> createState() => _SearchResultBodyState();
}

class _SearchResultBodyState extends State<SearchResultBody> {
  String selectedButton = 'Courses';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: (20)),
      child: Column(
        children: [
          SizedBox(height: (25)),
          Row(
            children: [
              Expanded(child: _buildCustomButton('Courses')),
              SizedBox(width: (10)),
              Expanded(child: _buildCustomButton('Mentors')),
            ],
          ),
          SizedBox(height: (24)),
          Row(
            children: [
              Text(
                'Results for ',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[900],
                ),
              ),
              Text(
                '“${widget.query}”',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
              const Spacer(),
              Text(
                '0 found',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          SizedBox(height: (20)),
          Expanded(
            child:
                selectedButton == 'Courses'
                    ? (widget.searchResponse.courses.isEmpty
                        ? NotFoundPage()
                        : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: widget.searchResponse.courses.length,
                          itemBuilder: (context, index) {
                            final course = widget.searchResponse.courses[index];
                            return CourseCard(
                              onTap: () {
                                Navigator.pushNamed(context, RouteNames.courseDetailsPage,arguments: course.id);
                              },
                              imagePath: course.image!,
                              category: "${course.category}",
                              title: course.title,
                              price: double.tryParse(course.price) ?? 0,
                              oldPrice: 80,
                              rating: 4.8,
                              students: 8289,
                              onBookmarkPressed: () {},
                            );
                          },
                        ))
                    : (widget.searchResponse.mentors.isEmpty
                        ? NotFoundPage()
                        : ListView.builder(
                          itemCount: widget.searchResponse.mentors.length,
                          itemBuilder: (context, index) {
                            final mentor = widget.searchResponse.mentors[index];
                            return ChatsWidget(
                              imagePath: 'assets/images/boy.png',
                              name: mentor.fullName,
                              jobTitle: mentor.expertiseDisplay,
                            );
                          },
                        )),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomButton(String title) {
    bool isSelected = selectedButton == title;

    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedButton = title;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isSelected ? Colors.blue : Colors.white,
        side: BorderSide(color: Colors.blue, width: (2)),
        padding: EdgeInsets.symmetric(horizontal: (55), vertical: (14)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.blue,
          fontSize: 18,
        ),
      ),
    );
  }
}
