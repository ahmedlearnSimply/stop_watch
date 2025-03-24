// ignore_for_file: unused_element

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stop_watch/screens/data/Time_state.dart';
import 'package:stop_watch/screens/data/Timer_event.dart';
import 'dart:async';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(TimerState.initial()) {
    on<TimerStarted>(_onStarted);
    on<TimerPaused>(_onPaused);
    on<TimerResumed>(_onResumed);
    on<TimerReset>(_onReset);
    on<TimerTicked>(_onTicked);
  }

  Timer? timer;
  void _onStarted(TimerStarted event, Emitter<TimerState> emit) {
    _startTicker();
    emit(state.copyWith(isRunning: true));
  }

  void _onPaused(TimerPaused event, Emitter<TimerState> emit) {
    timer?.cancel();
    emit(state.copyWith(isRunning: false));
  }

  void _onResumed(TimerResumed event, Emitter<TimerState> emit) {
    _startTicker(from: state.duration);
    emit(state.copyWith(isRunning: true));
  }

  void _onReset(TimerReset event, Emitter<TimerState> emit) {
    timer?.cancel();
    emit(TimerState.initial());
  }

  void _onTicked(TimerTicked event, Emitter<TimerState> emit) {
    emit(state.copyWith(duration: event.duration));
  }

  void _startTicker({int from = 0}) {
    timer?.cancel();
    int counter = from;
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      counter++;
      add(TimerTicked(counter));
    });
  }
}
