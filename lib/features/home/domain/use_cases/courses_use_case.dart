
import '../entities/course_response.dart';
import '../repositories/home_repo.dart';

class CoursesUseCase {
  final HomeRepo coursesRepository;

  CoursesUseCase(this.coursesRepository);

  Future<CourseResponse> call({
    required int limit,
    required int? categoryId,
  }) async {
    return await coursesRepository.getPopularCourses(
      limit: limit,
      categoryId: categoryId,
    );
  }
}
