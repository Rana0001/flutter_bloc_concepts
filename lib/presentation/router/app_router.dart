import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_practice/presentation/screen/counter_screen.dart';
import 'package:flutter_bloc_practice/presentation/screen/second_screen.dart';
import 'package:flutter_bloc_practice/presentation/screen/third_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
            builder: (_) => const CounterScreen(title: "Counter Screen"));

      case "/second":
        return MaterialPageRoute(
            builder: (_) => const SecondScreen(
                  title: "SecondScreen",
                ));
      case "/third":
        return MaterialPageRoute(
            builder: (_) => const ThirdScreen(title: "Third Screen"));
      default:
        throw Exception("404-Not-Found");
    }
  }
}
