
import '../entities/response_mentor.dart';
import '../repositories/home_repo.dart';

class TopMentorsUseCase {
  final HomeRepo homeRepository;

  TopMentorsUseCase(this.homeRepository);

  Future<ResponseMentor> call({required int limit}) async {
    return await homeRepository.getTopMentors(limit: limit);
  }
}
