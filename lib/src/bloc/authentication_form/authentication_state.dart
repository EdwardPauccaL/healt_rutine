import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
  @override
  List<Object> get props => [];
}
// Dos estados:
// Autenticado / Ya realizado -> Home
// No autenticado / No realizado -> Cuestionario

class Uninitialized extends AuthenticationState {
  @override
  String toString() => 'No inicializado';
}

class Authenticated extends AuthenticationState {
  final String displayName;

  const Authenticated(this.displayName);

  @override
  List<Object> get props => [displayName];

  @override
  String toString() => 'Autenticado - displayName :$displayName';
}

class Unauthenticated extends AuthenticationState {
  @override
  String toString() => 'No autenticado';
}
