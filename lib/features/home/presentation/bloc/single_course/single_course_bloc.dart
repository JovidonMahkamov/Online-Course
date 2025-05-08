import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_cases/single_course_use_case.dart';
import '../home_event.dart';
import 'single_course_state.dart';

class SingleCourseBloc extends Bloc<HomeEvent, SingleCourseState> {
  final SingleCourseUseCase getSingleCourseUseCase;

  SingleCourseBloc(this.getSingleCourseUseCase) : super(SingleCourseInitial()) {
    on<GetSingleCourseEvent>(onGetSingleCourse);
  }

  Future<void> onGetSingleCourse(event, emit) async {
    emit(SingleCourseLoading());
    try {
      final course = await getSingleCourseUseCase(courseId:event.id);
      emit(SingleCourseLoaded(course: course));
    } catch (e) {
      emit(SingleCourseError(message: e.toString()));
    }
  }
}
