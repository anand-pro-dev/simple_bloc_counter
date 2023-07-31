part of 'counter_bloc_bloc.dart';

@immutable
abstract class CounterBlocEvent {}

class CounterIncrementEvent extends CounterBlocEvent {}

class CounterDecrementEvent extends CounterBlocEvent {}
