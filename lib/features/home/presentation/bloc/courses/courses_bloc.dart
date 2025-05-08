import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/courses_use_case.dart';
import '../home_event.dart';
import 'courses_state.dart';

class CourseBloc extends Bloc<HomeEvent, CourseState> {
  final CoursesUseCase getCoursesUseCase;

  CourseBloc(this.getCoursesUseCase) : super(CourseInitial()) {
    on<GetPopularCourses>(onGetCourses);
  }

  Future<void> onGetCourses(event, emit) async {
    emit(CourseLoading());
    try {
      final courses = await getCoursesUseCase(
        limit: event.limit,
        categoryId: event.categoryId,
      );
      emit(CourseLoaded(courses: courses));
    } catch (e) {
      emit(CourseError(message: e.toString()));
    }
  }
}
