// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stop_watch/screens/data/Time_state.dart';
import 'package:stop_watch/screens/data/Timer_bloc.dart';
import 'package:stop_watch/screens/data/Timer_event.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: BlocProvider<TimerBloc>(
          create: (_) => TimerBloc(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<TimerBloc, TimerState>(builder: (context, state) {
                final minutes =
                    (state.duration ~/ 60).toString().padLeft(2, '0');
                final seconds =
                    (state.duration % 60).toString().padLeft(2, '0');
                return Text(
                  "$minutes:$seconds",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                );
              }),
              Gap(40),
              SizedBox(
                width: 100,
                height: 100,
                child: BlocBuilder<TimerBloc, TimerState>(
                    builder: (context, state) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal, // Button background color
                      foregroundColor: Colors.white, // Text color
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ), // Button padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(100), // Rounded corners
                      ),
                      elevation: 5, // Shadow elevation
                    ),
                    onPressed: () {
                      context.read<TimerBloc>().add(TimerStarted());
                    },
                    child: Text(
                      "Start",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
