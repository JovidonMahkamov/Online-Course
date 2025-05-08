
import '../../domain/entities/category_responce.dart';
import '../../domain/entities/notification_response.dart';
import '../../domain/entities/response_mentor.dart';
import '../../domain/entities/response_wishlist.dart';
import '../../domain/repositories/home_repo.dart';
import '../data_sources/home_remote_data_source.dart';
import '../models/course_model.dart';
import '../models/courses_response_model.dart';
import '../models/response_mentor.dart';
import '../models/search_response_model.dart';

class HomeRepositoryImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<CoursesResponseModel> getPopularCourses({
    required int limit,
    required int? categoryId,
  }) async {
    return await homeRemoteDataSource.getPopularCourses(
      limit: limit,
      categoryId: categoryId,
    );
  }

  @override
  Future<MentorsResponseModel> getTopMentors({required int limit}) async {
    return await homeRemoteDataSource.getMentors(limit: limit);
  }

  @override
  Future<ResponseMentor> getMentors({required int limit}) async {
    return await homeRemoteDataSource.getTopMentors(limit: limit);
  }

  @override
  Future<CourseModel> getSingleCourses({required int id}) async {
    return await homeRemoteDataSource.getSingleCourses(id: id);
  }

  @override
  Future<CategoryResponse> getCategories({required int limit}) async {
    return await homeRemoteDataSource.getCategories(limit: limit);
  }

  @override
  Future<SearchResponseModel> search({required String query}) async {
    return await homeRemoteDataSource.search(query: query);
  }

  @override
  Future<WishlistResponse> getWishlist({
    required int limit,
    required int? categoryId,
  }) async {
    return await homeRemoteDataSource.getWishlist(
      limit: limit,
      categoryId: categoryId,
    );
  }

  @override
  Future<void> addToWishlist({required int courseId}) async {
    return await homeRemoteDataSource.addToWishlist(courseId: courseId);
  }

  @override
  Future<NotificationResponse> getNotifications() async {
    return await homeRemoteDataSource.getNotifications();
  }

  @override
  Future<void> removeFromWishlist({required int courseId}) {
    return homeRemoteDataSource.removeFromWishlist(courseId: courseId);
  }
}
