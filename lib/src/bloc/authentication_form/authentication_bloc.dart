import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:healt_rutine/src/bloc/authentication_form/bloc.dart';
import 'package:healt_rutine/src/repository/form_repository.dart';
import 'package:flutter/material.dart';

//part 'authentication_event.dart';
//part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;
  @override
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is FormeIn) {
      yield* _mapLoggedInToState();
    }
    if (event is FormeOut) {
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState() async* {
    yield Authenticated(await _userRepository.getUser());
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    yield Unauthenticated();
    _userRepository.signOut();
  }
}
