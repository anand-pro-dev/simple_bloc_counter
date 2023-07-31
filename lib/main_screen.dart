import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:simple_bloc/conter_app/counter_sceen_one.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            customButton(
              pageName: CounterBlocMain(),
              context: context,
              text: 'Button',
            ),
          ],
        ),
      ),
    );
  }
}

Widget customButton(
    {required String text,
    // required VoidCallback onTap,
    required BuildContext context,
    required Widget pageName}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () {
        // log("Anand");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => pageName),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        width: 100,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.teal, borderRadius: BorderRadius.circular(40)),
        child: Center(child: Text(text)),
      ),
    ),
  );
}
