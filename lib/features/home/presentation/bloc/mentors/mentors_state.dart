
import '../../../domain/entities/response_mentor.dart';

abstract class MentorState {
  const MentorState();
}

class MentorInitial extends MentorState {}

class MentorLoading extends MentorState {}

class MentorLoaded extends MentorState {
  final ResponseMentor mentors;

  const MentorLoaded({required this.mentors});
}

class MentorError extends MentorState {
  final String message;

  const MentorError({required this.message});
}
