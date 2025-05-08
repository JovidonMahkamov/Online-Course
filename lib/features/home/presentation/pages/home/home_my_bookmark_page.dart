import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:portfolio1/core/route/route_names.dart';
import 'package:shimmer/shimmer.dart';
import '../../bloc/category/category_bloc.dart';
import '../../bloc/category/category_state.dart';
import '../../bloc/courses/courses_bloc.dart';
import '../../bloc/courses/courses_state.dart';
import '../../bloc/home_event.dart';
import '../../widgets/course_card_wg.dart';
import '../../widgets/custom_choise_chip_wg.dart';

class HomeMyBookmarkPage extends StatefulWidget {
  const HomeMyBookmarkPage({super.key});

  @override
  State<HomeMyBookmarkPage> createState() => _HomeMyBookmarkPageState();
}

class _HomeMyBookmarkPageState extends State<HomeMyBookmarkPage> {
  int selectedIndex = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CourseBloc>().add(
      GetPopularCourses(limit: 10, categoryId: null),
    );
    context.read<CategoryBloc>().add(GetCategoriesEvent(limit: 10));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(IconlyLight.more_circle))
        ],
        title: const Text(
          'My Bookmark',
          style: TextStyle(fontSize: 25),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: (14)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: (10)),
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
              SizedBox(height: (8)),
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
}
