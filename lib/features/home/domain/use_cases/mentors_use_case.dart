
import '../entities/response_mentor.dart';
import '../repositories/home_repo.dart';

class MentorsUseCase {
  final HomeRepo mentorsRepository;

  MentorsUseCase(this.mentorsRepository);

  Future<ResponseMentor> call({required int limit}) async {
    return await mentorsRepository.getMentors(limit: limit);
  }
}