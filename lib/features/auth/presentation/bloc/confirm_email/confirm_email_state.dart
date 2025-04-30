import 'package:equatable/equatable.dart';

import '../../../domain/entities/token_entity.dart';

abstract class ConfirmEmailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ConfirmEmailInitial extends ConfirmEmailState {}

class ConfirmEmailLoading extends ConfirmEmailState {}

class ConfirmEmailSuccess extends ConfirmEmailState {
  final TokenEntity token;

  ConfirmEmailSuccess({required this.token});

  @override
  List<Object?> get props => [token];
}

class ConfirmEmailFailure extends ConfirmEmailState {
  final String error;

  ConfirmEmailFailure({required this.error});

  @override
  List<Object?> get props => [error];
}