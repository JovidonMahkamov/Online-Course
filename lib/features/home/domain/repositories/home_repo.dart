import '../entities/category_responce.dart';
import '../entities/course_response.dart';
import '../entities/courses.dart';
import '../entities/notification_response.dart';
import '../entities/response_mentor.dart';
import '../entities/response_wishlist.dart';
import '../entities/search_response.dart';

abstract class HomeRepo {
  //! Courses
  Future<CourseResponse> getPopularCourses({
    required int limit,
    required int? categoryId,
  });

  Future<Course> getSingleCourses({required int id});

  //! Category
  Future<CategoryResponse> getCategories({required int limit});

  //! Mentors
  Future<ResponseMentor> getTopMentors({required int limit});

  Future<ResponseMentor> getMentors({required int limit});

  //! Search
  Future<SearchResponse> search({required String query});

  //! Wishlist
  Future<WishlistResponse> getWishlist({
    required int limit,
    required int? categoryId,
  });

  Future<void> addToWishlist({required int courseId});

  Future<void> removeFromWishlist({required int courseId});

  //! Notification
  Future<NotificationResponse> getNotifications();

  //! Lessons
  // Future<LessonsResponse> getLessons({required int courseId});
}
