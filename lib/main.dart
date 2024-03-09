import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/business_logics/cubit/counter_cubit.dart';
import 'package:flutter_bloc_practice/presentation/screen/counter_screen.dart';
import 'package:flutter_bloc_practice/presentation/screen/second_screen.dart';
import 'package:flutter_bloc_practice/presentation/screen/third_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit counterCubit = CounterCubit();

  @override
  void dispose() {
    // TODO: implement dispose
    counterCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => BlocProvider.value(
              value: counterCubit,
              child: const CounterScreen(title: "Counter Screen"),
            ),
        "/second": (context) => BlocProvider.value(
              value: counterCubit,
              child: const SecondScreen(title: "Second Screen"),
            ),
        "/third": (context) => BlocProvider.value(
              value: counterCubit,
              child: const ThirdScreen(title: "Third Screen"),
            )
      },
    );
  }
}
