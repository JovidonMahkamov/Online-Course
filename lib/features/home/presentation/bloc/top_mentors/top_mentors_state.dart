
import '../../../domain/entities/response_mentor.dart';

abstract class TopMentorsState {
  const TopMentorsState();
}

class TopMentorsInitial extends TopMentorsState {}

class TopMentorsLoading extends TopMentorsState {}

class TopMentorsLoaded extends TopMentorsState {
  final ResponseMentor mentors;

  const TopMentorsLoaded({required this.mentors});
}

class TopMentorsError extends TopMentorsState {
  final String message;

  const TopMentorsError({required this.message});
}