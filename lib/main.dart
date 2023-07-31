import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_bloc/color/color_bloc/color_bloc.dart';
import 'package:simple_bloc/conter_app/counter_bloc/counter_bloc_bloc.dart';
import 'package:simple_bloc/conter_app/counter_sceen_one.dart';
import 'package:simple_bloc/main_screen.dart';

///   flutter build apk --release
///  flutter build appbundle --target-platform android-arm,android-arm64,android-x64
///  flutter build appbundle --target-platform android-arm
/// flutter build apk --analyze-size --target-platform android-arm
/// flutter run -d chrome --web-browser-flag "--disable-web-security"
///   F:\@ Program_Files\flutter\bin\cache\dart-sdk
///

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBlocBloc(),
        ),
        BlocProvider(
          create: (context) => ColorBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Project',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        // home: MainScreen(),
        home: CounterBlocMain(),
      ),
    );
  }
}
