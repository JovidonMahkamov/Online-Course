import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/top_mentors_use_case.dart';
import '../home_event.dart';
import 'top_mentors_state.dart';

class TopMentorsBloc extends Bloc<HomeEvent, TopMentorsState> {
  final TopMentorsUseCase getTopMentorsUseCase;

  TopMentorsBloc(this.getTopMentorsUseCase) : super(TopMentorsInitial()) {
    on<GetTopMentors>(onGetTopMentors);
  }

  Future<void> onGetTopMentors(event, emit) async {
    emit(TopMentorsLoading());
    try {
      final mentors = await getTopMentorsUseCase(limit: event.limit);
      emit(TopMentorsLoaded(mentors: mentors));
    } catch (e) {
      emit(TopMentorsError(message: e.toString()));
    }
  }
}
