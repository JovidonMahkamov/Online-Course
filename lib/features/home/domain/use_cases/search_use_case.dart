import '../entities/search_response.dart';
import '../repositories/home_repo.dart';

class SearchUseCase {
  final HomeRepo homeRepo;

  SearchUseCase(this.homeRepo);

  Future<SearchResponse> call({required String query}) async {
    return await homeRepo.search(query: query);
  }
}