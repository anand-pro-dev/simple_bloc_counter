import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_bloc_event.dart';
part 'counter_bloc_state.dart';

class CounterBlocBloc extends Bloc<CounterBlocEvent, CounterBlocState> {
  CounterBlocBloc() : super(CounterBlocInitialState()) {
    // on<CounterBlocEvent>((event, emit) {
    //   // TODO: implement event handler
    // });

    on<CounterIncrementEvent>((event, emit) {
      emit(CounterBlocIncrementState(state.counter + 1));
    });

    on<CounterDecrementEvent>((event, emit) {
      emit(CounterBlocDecrementState(state.counter - 1));
    });
  }
}
