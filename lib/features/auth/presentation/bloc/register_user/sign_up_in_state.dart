import 'package:equatable/equatable.dart';

import '../../../domain/entities/register_entity.dart';

abstract class RegisterUserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterUserInitial extends RegisterUserState {}

class RegisterUserLoading extends RegisterUserState {}

class RegisterUserSuccess extends RegisterUserState {
  final RegisterEntity registerEntity;

  RegisterUserSuccess({required this.registerEntity});

  @override
  List<Object?> get props => [registerEntity];
}

class RegisterUserError extends RegisterUserState {
  final String error;

  RegisterUserError({required this.error});

  @override
  List<Object?> get props => [error];
}