import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:simple_bloc/color/color_bloc/color_state.dart';

import '../../conter_app/counter_bloc/counter_bloc_bloc.dart';

class ColorBloc extends Bloc<CounterBlocEvent, ColorBlocState> {
  ColorBloc() : super(ColorBlocInitialState()) {
    on<CounterIncrementEvent>((event, emit) {
      emit(ColorBlocIncrementState(Colors.green));
    });

    on<CounterDecrementEvent>((event, emit) {
      emit(ColorBlocDecrementState(Colors.red));
    });
  }
}
