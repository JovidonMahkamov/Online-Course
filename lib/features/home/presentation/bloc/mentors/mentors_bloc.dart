import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_cases/mentors_use_case.dart';
import '../home_event.dart';
import 'mentors_state.dart';

class MentorBloc extends Bloc<HomeEvent, MentorState> {
  final MentorsUseCase getMentorsUseCase;

  MentorBloc(this.getMentorsUseCase) : super(MentorInitial()) {
    on<GetMentors>(onGetMentors);
  }

  Future<void> onGetMentors(event, emit) async {
    emit(MentorLoading());
    try {
      final mentors = await getMentorsUseCase(limit: event.limit);
      emit(MentorLoaded(mentors: mentors));
    } catch (e) {
      emit(MentorError(message: e.toString()));
    }
  }
}
