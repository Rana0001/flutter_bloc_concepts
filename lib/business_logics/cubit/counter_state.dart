part of 'counter_cubit.dart';

class CounterState extends Equatable {
  int counterValue;
  bool wasIncremented;

  CounterState({required this.counterValue, required this.wasIncremented});

  @override
  // TODO: implement props
  List<Object?> get props => [this.counterValue, this.wasIncremented];
}
