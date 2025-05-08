import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_cases/search_use_case.dart';
import '../home_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<HomeEvent, SearchState> {
  final SearchUseCase searchUseCase;

  SearchBloc(this.searchUseCase) : super(SearchInitial()) {
    on<SearchEvent>(onSearchCourse);
  }

  Future<void> onSearchCourse(event, emit) async {
    emit(SearchLoading());
    try {
      final response = await searchUseCase(query: event.query);
      emit(SearchLoaded(searchResponse: response));
    } catch (e) {
      emit(SearchError(message: e.toString()));
    }
  }
}
