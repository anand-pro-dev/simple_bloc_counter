import 'package:flutter/material.dart';

abstract class ColorBlocState {
  Color color = Colors.purple;
  ColorBlocState({required this.color});
}

class ColorBlocInitialState extends ColorBlocState {
  ColorBlocInitialState() : super(color: Colors.purple);
}

class ColorBlocIncrementState extends ColorBlocState {
  ColorBlocIncrementState(Color increasedColor) : super(color: increasedColor);
}

class ColorBlocDecrementState extends ColorBlocState {
  ColorBlocDecrementState(Color decresedColor) : super(color: decresedColor);
}
