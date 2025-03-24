class TimerState {
  final int duration;
  final bool isRunning;

  TimerState({required this.duration, required this.isRunning});
  factory TimerState.initial() => TimerState(duration: 0, isRunning: false);

  TimerState copyWith({int? duration, bool? isRunning}) {
    return TimerState(
      duration: duration ?? this.duration,
      isRunning: isRunning ?? this.isRunning,
    );
  }
}
