import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:healt_rutine/src/bloc/authentication_bloc/bloc.dart';
import 'package:healt_rutine/src/bloc/simple_bloc_delegate.dart';
import 'package:healt_rutine/src/repository/user_repository.dart';
import 'package:healt_rutine/src/Cuestionario/questionnaire_One.dart';
import 'package:healt_rutine/src/ui/login/login_screen.dart';
import 'package:healt_rutine/src/ui/principalhome.dart';
import 'package:healt_rutine/src/ui/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final UserRepository userRepository = UserRepository();
  runApp(BlocProvider(
    create: (context) =>
        AuthenticationBloc(userRepository: userRepository)..add(AppStarted()),
    child: App(userRepository: userRepository),
  ));
}

//Widget
class App extends StatelessWidget {
  final UserRepository _userRepository;

  App({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Uninitialized) {
            return SplashScreen();
          }
          //BottomNavBar(name: state.displayName,)

          if (state is Authenticated) {
            return QuestionnaireOne();
          }
          if (state is Unauthenticated) {
            return LoginScreen(
              userRepository: _userRepository,
            );
          }
          return Container();
        },
      ),
    );
  }
}
