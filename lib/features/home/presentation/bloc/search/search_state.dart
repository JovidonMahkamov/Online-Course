
import '../../../domain/entities/search_response.dart';

abstract class SearchState {
  const SearchState();
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final SearchResponse? searchResponse;

  const SearchLoaded({required this.searchResponse});
}

class SearchError extends SearchState {
  final String message;

  const SearchError({required this.message});
}
