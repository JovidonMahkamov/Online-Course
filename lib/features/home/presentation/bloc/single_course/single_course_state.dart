
import '../../../domain/entities/courses.dart';

abstract class SingleCourseState {
  const SingleCourseState();
}

class SingleCourseInitial extends SingleCourseState {}

class SingleCourseLoading extends SingleCourseState {}

class SingleCourseLoaded extends SingleCourseState {
  final Course course;

  const SingleCourseLoaded({required this.course});
}

class SingleCourseError extends SingleCourseState {
  final String message;

  const SingleCourseError({required this.message});
}
