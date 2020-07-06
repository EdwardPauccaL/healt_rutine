import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}
// Dos eventos:

// FormeIn
// FormeOut

class FormeIn extends AuthenticationEvent {}

class FormeOut extends AuthenticationEvent {}
