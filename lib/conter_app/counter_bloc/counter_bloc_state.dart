part of 'counter_bloc_bloc.dart';

@immutable
abstract class CounterBlocState {
  int counter = 0;
  CounterBlocState({required this.counter});
}

class CounterBlocInitialState extends CounterBlocState {
  CounterBlocInitialState() : super(counter: 0);
}

class CounterBlocIncrementState extends CounterBlocState {
  CounterBlocIncrementState(int increasedCounter)
      : super(counter: increasedCounter);
}

class CounterBlocDecrementState extends CounterBlocState {
  CounterBlocDecrementState(int decresedCounter)
      : super(counter: decresedCounter);
}
