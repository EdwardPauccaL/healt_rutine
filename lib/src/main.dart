import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'blocs/my_bloc_delegate.dart';
import 'blocs/counter_bloc.dart';
import 'blocs/stopwatch_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocSupervisor.delegate = MyBlocDelegate();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(create: (context) => CounterBloc()),
        BlocProvider<StopwatchBloc>(create: (context) => StopwatchBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: HomeScreen(),
      ),
    ),
  );
}
