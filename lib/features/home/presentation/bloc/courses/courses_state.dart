
import '../../../domain/entities/course_response.dart';

abstract class CourseState {
  const CourseState();
}

class CourseInitial extends CourseState {}

class CourseLoading extends CourseState {}

class CourseLoaded extends CourseState {
  final CourseResponse courses;

  const CourseLoaded({required this.courses});
}

class CourseError extends CourseState {
  final String message;

  const CourseError({required this.message});
}
