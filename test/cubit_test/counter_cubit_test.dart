// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_bloc_practice/logic/cubit/counter_cubit.dart';
// import 'package:test/expect.dart';
// import 'package:test/scaffolding.dart';

// void main() {
//   group("Counter Cubit Test", () {
//     CounterCubit? counterCubit;
//     setUp(() {
//       counterCubit = CounterCubit();
//     });

//     tearDown(() {
//       counterCubit?.close();
//     });

//     test(
//         'The initial value for the counterCubit is CounterState(counterValue:0, wasIncremented: false)',
//         () {
//       expect(counterCubit?.state,
//           CounterState(counterValue: 0, wasIncremented: false));
//     });

//     blocTest(
//       "The cubit should emit a CounterState(counterValue:1, wasIncremented: true) when cubit.incremented function is called",
//       build: () => counterCubit!,
//       expect: () => [CounterState(counterValue: 1, wasIncremented: true)],
//       act: (cubit) {
//         cubit.increment();
//       },
//     );

//     blocTest(
//       "The cubit should emit a CounterState(counterValue:-1, wasIncremented: false) when cubit.decremented function is called",
//       build: () => counterCubit!,
//       expect: () => [CounterState(counterValue: -1, wasIncremented: false)],
//       act: (cubit) {
//         cubit.decrement();
//       },
//     );
//   });
// }
