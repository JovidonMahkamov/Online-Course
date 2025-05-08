
import '../entities/courses.dart';
import '../repositories/home_repo.dart';

class SingleCourseUseCase {
  final HomeRepo courseRepository;

  SingleCourseUseCase(this.courseRepository);

  Future<Course> call({required int courseId}) async {
    return await courseRepository.getSingleCourses(id: courseId);
  }
}
