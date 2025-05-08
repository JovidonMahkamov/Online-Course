
import '../models/category_response_model.dart';
import '../models/course_model.dart';
import '../models/courses_response_model.dart';
import '../models/notification_response_model.dart';
import '../models/response_mentor.dart';
import '../models/response_wishlist_model.dart';
import '../models/search_response_model.dart';

abstract class HomeRemoteDataSource {
  //! Courses
  Future<CoursesResponseModel> getPopularCourses({
    required int limit,
    required int? categoryId,
  });

  Future<CourseModel> getSingleCourses({required int id});

  //! Category
  Future<CategoryResponseModel> getCategories({required int limit});

  //! Mentors
  Future<MentorsResponseModel> getTopMentors({required int limit});

  Future<MentorsResponseModel> getMentors({required int limit});

  //! Search
  Future<SearchResponseModel> search({required String query});

  //! Wishlist
  Future<ResponseWishlistModel> getWishlist({
    required int limit,
    required int? categoryId,
  });

  Future<void> addToWishlist({required int courseId});

  Future<void> removeFromWishlist({required int courseId});

  //! Notification
  Future<NotificationResponseModel> getNotifications();
}
