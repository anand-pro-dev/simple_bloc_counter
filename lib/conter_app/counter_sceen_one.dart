import 'dart:developer';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_bloc/color/color_bloc/color_bloc.dart';
import 'package:simple_bloc/color/color_bloc/color_state.dart';
import 'package:simple_bloc/conter_app/counter_bloc/counter_bloc_bloc.dart';

class CounterBlocMain extends StatelessWidget {
  const CounterBlocMain({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 40,
            width: double.infinity,
          ),

          //==========================  bloc Builder =====================//
          BlocBuilder<CounterBlocBloc, CounterBlocState>(
            buildWhen: (previous, current) {
              log(previous.counter.toString());
              log(current.counter.toString());

              /// Some Simple logic also there
              /// //
              return current.counter >= 2;
            },
            builder: (context, state) {
              return Text(state.counter.toString());
            },
          ),
          const SizedBox(
            height: 40,
            width: double.infinity,
          ),
          //==========================  bloc Listner ======================//
          BlocListener<CounterBlocBloc, CounterBlocState>(
            //  ..........some simple concepts
            listenWhen: (previous, current) {
              return true;
            },
            //
            listener: (context, state) {
              if (state.counter >= 5) {
                final snackBar = SnackBar(
                  /// need to set following properties for best effect of awesome_snackbar_content
                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  content: AwesomeSnackbarContent(
                    title: 'On Snap!',
                    message: 'From Bloc Listner widget',

                    /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                    contentType: ContentType.success,
                  ),
                );

                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
              }
            },
            child: const Text(" From Bloc Listner"),
          ),
          const SizedBox(
            height: 40,
            width: double.infinity,
          ),
          //
          //==========================  bloc Consumer  ======================//
          //
          /* When we combine all the functionlity of lister and builder then we use this*/
          BlocConsumer<CounterBlocBloc, CounterBlocState>(
            builder: (context, state) {
              return Text(state.counter.toString());
            },
            listener: (context, state) {
              if (state.counter <= 5) {
                final snackBar = SnackBar(
                  /// need to set following properties for best effect of awesome_snackbar_content
                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  content: AwesomeSnackbarContent(
                    title: 'On Snap!',
                    message: 'From Bloc Listner widget',

                    /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                    contentType: ContentType.help,
                  ),
                );

                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
              }
            },
          ),
          const SizedBox(
            height: 40,
            width: double.infinity,
          ),
          //
          //==========================  bloc Selector  ======================//
          //
          /* When we combine State */
          BlocSelector<CounterBlocBloc, CounterBlocState, bool>(
              selector: (state) => state.counter >= 10 ? true : false,
              builder: (context, state) {
                return Container(
                  height: 100,
                  width: 100,
                  color: state ? Colors.red : Colors.blue,
                  child: const Center(
                    child: Text("More Than 10"),
                  ),
                );
              }),
          const SizedBox(
            height: 40,
            width: double.infinity,
          ),
          //
          //==========================  bloc Consumer From Color Bloc ======================//

          /* From Color Bloc we are using */
          BlocBuilder<ColorBloc, ColorBlocState>(
            buildWhen: (previous, current) {
              log(previous.color.toString());
              log(current.color.toString());

              /// Some Simple logic also there

              return true;
            },
            builder: (context, state) {
              return Container(
                height: 100,
                width: 100,
                color: state.color,
                child: const Center(
                  child: Text("From Color Bloc"),
                ),
              );
            },
          ),
          const SizedBox(
            height: 40,
            width: double.infinity,
          ),
        ],
      ),

      ///===================>>>>>>>>>>>>> buttons >>>>>>>>>>>>>>====>=================///
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBlocBloc>().add(CounterIncrementEvent());
              // you can comment the color button
              context.read<ColorBloc>().add(CounterIncrementEvent());
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBlocBloc>().add(CounterDecrementEvent());
              context.read<ColorBloc>().add(CounterDecrementEvent());
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
