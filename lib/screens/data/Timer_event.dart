abstract class TimerEvent {}

class TimerStarted extends TimerEvent {}

class TimerPaused extends TimerEvent {}

class TimerReset extends TimerEvent {}

class TimerResumed extends TimerEvent {}

class TimerTicked extends TimerEvent {
  final int duration;
  TimerTicked(this.duration);
}
