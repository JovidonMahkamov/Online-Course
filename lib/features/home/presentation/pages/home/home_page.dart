import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:portfolio1/core/route/route_names.dart';
import 'package:shimmer/shimmer.dart';

import '../../bloc/category/category_bloc.dart';
import '../../bloc/category/category_state.dart';
import '../../bloc/courses/courses_bloc.dart';
import '../../bloc/courses/courses_state.dart';
import '../../bloc/home_event.dart';
import '../../bloc/top_mentors/top_mentors_bloc.dart';
import '../../bloc/top_mentors/top_mentors_state.dart';
import '../../widgets/course_card_wg.dart';
import '../../widgets/custom_choise_chip_wg.dart';
import '../../widgets/text_field_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CourseBloc>().add(GetPopularCourses(limit: 10));
    context.read<TopMentorsBloc>().add(GetTopMentors(limit: 10));
    context.read<CategoryBloc>().add(GetCategoriesEvent(limit: 10));
  }

  bool isColor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SizedBox(
              width: 15.w,
              height: 15,
            ),
            const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/home/home_profil.png'),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              children: [
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "Good Morning 👋",
                  style: TextStyle(
                      fontSize: 16.sp, color: const Color(0xff757575)),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Andrew Ainsley",
                  style: TextStyle(
                      fontSize: 20.sp, color: const Color(0xff212121)),
                ),
                SizedBox(
                  height: 5.h,
                )
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.homeNotification);
            },
            icon: const Icon(IconlyLight.notification),
          ),
          IconButton(
            onPressed: () {
              // Navigator.pushNamed(context, RouteNames.mostPopularCourses);
            },
            icon: const Icon(IconlyLight.bookmark),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 25,
                ),
                child: Column(
                  children: [
                    TextFieldWidget(),
                    Image.asset(
                      'assets/home/big_container.png',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 25, left: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Top Mentors",
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RouteNames.topMentors);
                            },
                            child: Text(
                              'See All',
                              style: TextStyle(
                                  color: Colors.blueAccent, fontSize: 16.sp),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                  ],
                ),
              ),
              BlocBuilder<TopMentorsBloc, TopMentorsState>(
                builder: (context, state) {
                  if (state is TopMentorsLoading) {
                    return SizedBox(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: (12)),
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                width: (90),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.all((8)),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is TopMentorsLoaded) {
                    final mentors = state.mentors.results;
                    return mentors.isEmpty
                        ? Center(child: Text('No mentors available'))
                        : SizedBox(
                            height: 120,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.mentors.count,
                              itemBuilder: (context, index) {
                                final mentor = mentors[index];
                                return columnWg(
                                  mentor.avatarUrl ?? 'Null',
                                  mentor.fullName,
                                );
                              },
                            ),
                          );
                  } else if (state is TopMentorsError) {
                    return Center(child: Text('Error: ${state.message}'));
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                padding: const EdgeInsets.only(right: 25, left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Most Popular Courses",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.homeMyBookmark);
                      },
                      child: Text(
                        'See All',
                        style: TextStyle(
                            color: Colors.blueAccent, fontSize: 16.sp),
                      ),
                    )
                  ],
                ),
              ),
              BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoading) {
                    return SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: (12)),
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                width: (90),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.all((8)),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is CategoryLoaded) {
                    final categories = state.categories;
                    return SizedBox(
                      height: (40),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.count + 1,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return CustomChoiceChipWg(
                              index: -1,
                              label: 'All',
                              selectedIndex: selectedIndex,
                              onSelected: (selected) {
                                setState(() {
                                  selectedIndex = selected ? -1 : selectedIndex;
                                });
                                context.read<CourseBloc>().add(
                                  GetPopularCourses(limit: 10),
                                );
                              },
                            );
                          } else {
                            final category = categories.results[index - 1];
                            return CustomChoiceChipWg(
                              index: index - 1,
                              label: category.name,
                              selectedIndex: selectedIndex,
                              onSelected: (selected) {
                                setState(() {
                                  selectedIndex =
                                  selected ? index - 1 : selectedIndex;
                                });
                                context.read<CourseBloc>().add(
                                  GetPopularCourses(
                                    limit: 10,
                                    categoryId: category.id,
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                    );
                  } else if (state is CategoryError) {
                    return Center(child: Text('Ошибка: ${state.message}'));
                  }
                  return const SizedBox.shrink();
                },
              ),
              SizedBox(
                height: 25.h,
              ),

              BlocBuilder<CourseBloc, CourseState>(
                builder: (context, state) {
                  if (state is CourseLoading) {
                    return SizedBox(
                      height: 320,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(top: (12)),
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                height: (120),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.all((8)),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is CourseLoaded) {
                    final courses = state.courses;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: courses.count,
                      itemBuilder: (context, index) {
                        final course = courses.results[index];
                        return CourseCard(
                          onTap: () {
                            Navigator.pushNamed(context, RouteNames.courseDetailsPage,arguments: course.id);
                          },
                          imagePath: course.image!,
                          category: course.categoryName!,
                          title: course.title,
                          price: double.tryParse(course.price) ?? 0,
                          oldPrice: 80,
                          rating: 4.8,
                          students: 8289,
                          isInWishlist: course.isInWishlist,
                          courseId: course.id,
                          onBookmarkPressed: () {},
                        );
                      },
                    );
                  } else if (state is CourseError) {
                    return Center(child: Text('Error: ${state.message}'));
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget columnWg(String imagePath, String name) {
    return Container(
      margin: EdgeInsets.only(right: (15)),
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: imagePath,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => Icon(
                  IconlyBold.user_3,
                  color: Colors.grey[400],
                  size: (50),
                ),
              ),
            ),
          ),
          SizedBox(height: (8)),
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[900],
            ),
          ),
        ],
      ),
    );
  }
}
