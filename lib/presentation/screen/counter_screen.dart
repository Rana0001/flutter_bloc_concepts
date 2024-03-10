import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/constants/enums.dart';
import 'package:flutter_bloc_practice/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_practice/logic/cubit/internet_cubit.dart';
import 'package:flutter_bloc_practice/presentation/screen/second_screen.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key, required this.title});

  final String title;

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
              if (state is InternetConnected &&
                  state.connectionType == ConnectionType.Wifi) {
                return Text(
                  "Wi-fi",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: Colors.green),
                );
              } else if (state is InternetConnected &&
                  state.connectionType == ConnectionType.Mobile) {
                return Text(
                  "Mobile",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: Colors.red),
                );
              } else if (state is InternetDisconnected) {
                return Text(
                  "Disconnected",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: Colors.yellow),
                );
              }
              return const CircularProgressIndicator();
            }),
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Colors.green,
                    content: Center(
                      child: Text(
                        "Increment",
                      ),
                    ),
                    duration: Duration(milliseconds: 300),
                  ));
                } else if (state.wasIncremented == false) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Colors.redAccent,
                    content: Center(
                      child: Text(
                        "Decrement",
                      ),
                    ),
                    duration: Duration(milliseconds: 300),
                  ));
                }
              },
              builder: (context, state) {
                return Text(
                  '${state.counterValue}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            MaterialButton(
              color: Colors.redAccent,
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pushNamed("/second");
              },
              child: const Text("Go to Second Screen"),
            ),
            MaterialButton(
              color: Colors.redAccent,
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pushNamed("/third");
              },
              child: const Text("Go to Third Screen"),
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().increment();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().decrement();
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
