import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/business_logics/cubit/counter_cubit.dart';
import 'package:flutter_bloc_practice/presentation/screen/counter_screen.dart';
import 'package:flutter_bloc_practice/presentation/screen/second_screen.dart';
import 'package:flutter_bloc_practice/presentation/screen/third_screen.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: const CounterScreen(title: "Counter Screen"),
                ));

      case "/second":
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: const SecondScreen(
                    title: "SecondScreen",
                  ),
                ));
      case "/third":
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _counterCubit,
                child: const ThirdScreen(title: "Third Screen")));
      default:
        throw Exception("404-Not-Found");
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
