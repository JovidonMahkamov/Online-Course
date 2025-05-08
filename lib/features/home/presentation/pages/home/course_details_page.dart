import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../../bloc/add_to_wishlist/add_to_wishlist__bloc.dart';
import '../../bloc/home_event.dart';
import '../../bloc/remove_from_wishlist/remove_from_wishlist_bloc.dart';
import '../../bloc/single_course/single_course_bloc.dart';
import '../../bloc/single_course/single_course_state.dart';
import '../../widgets/about_screen_wg.dart';
import '../../widgets/course_info_wg.dart';
import '../../widgets/lesson_screen_wg.dart';
import '../../widgets/review_screen_wg.dart';

class CourseDetailsPage extends StatefulWidget {
  final int id;

  const CourseDetailsPage({super.key, required this.id});

  @override
  State<CourseDetailsPage> createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    context.read<SingleCourseBloc>().add(GetSingleCourseEvent(id: widget.id));
  }

  void toggleWishlist(bool isInWishlist, int courseId) {
    if (!isInWishlist) {
      context.read<AddWishlistBloc>().add(
        AddToWishlistEvent(courseId: courseId),
      );
    } else {
      context.read<RemoveFromWishlistBloc>().add(
        RemoveFromWishlistEvent(courseId: courseId),
      );
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<SingleCourseBloc, SingleCourseState>(
        builder: (context, state) {
          if (state is SingleCourseLoading) {
            return const Center(
              child:SizedBox(
                width: 60,
                height: 60,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballSpinFadeLoader,
                  colors: [Colors.blueAccent],
                  strokeWidth: 2,
                ),
              ),
            );
          } else if (state is SingleCourseLoaded) {
            final course = state.course;
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: (200),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: CachedNetworkImage(
                            imageUrl: course.image ?? '',
                            fit: BoxFit.cover,
                            errorWidget:
                                (context, url, error) => Image.asset(
                              "assets/home/course.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).padding.top + 10,
                          left: 16,
                          child: CircleAvatar(
                            backgroundColor: Colors.white.withOpacity(0.8),
                            child: IconButton(
                              icon: const Icon(
                                IconlyLight.arrow_left,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: (20)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                course.title,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed:
                                  () => toggleWishlist(
                                course.isInWishlist,
                                course.id,
                              ),
                              icon: Icon(
                                course.isInWishlist
                                    ? IconlyBold.bookmark
                                    : IconlyLight.bookmark,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.blue,
                              ),
                              child: Text(
                                "${course.categoryName}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            const Icon(IconlyBold.star, color: Colors.amber),
                            const SizedBox(width: 5),
                            const Text(
                              "0 reviews",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "\$${course.price}",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 32,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CourseInfoWidget(
                              icon: Icon(
                                IconlyBold.user_3,
                                color: Colors.blue,
                                size: 20,
                              ),
                              title: 'Students',
                            ),
                            CourseInfoWidget(
                              icon: Icon(
                                IconlyBold.time_circle,
                                color: Colors.blue,
                                size: 16,
                              ),
                              title: '0 Hours',
                            ),
                            CourseInfoWidget(
                              icon: Icon(
                                IconlyBold.document,
                                color: Colors.blue,
                                size: 20,
                              ),
                              title: 'Certificate',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  TabBar(
                    controller: _tabController,
                    tabs: const [
                      Tab(text: 'About'),
                      Tab(text: 'Lessons'),
                      Tab(text: 'Reviews'),
                    ],
                  ),
                  SizedBox(
                    height:
                    MediaQuery.of(context).size.height -
                        kToolbarHeight -
                        kBottomNavigationBarHeight -
                        200,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        AboutScreen(course: course),
                        LessonScreen(sections: course.sections),
                        ReviewsScreen(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: (16),
                      right: (16),
                      bottom: (30),
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: Text(
                        "Enroll Course - \$${course.price}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is SingleCourseError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}