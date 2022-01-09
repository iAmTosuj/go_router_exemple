part of 'main_cubit.dart';

enum pageState {
  loading,
  error,
  success,
}

class MainState {
  final pageState status;
  final int counter;

  MainState({
    this.status = pageState.loading,
    this.counter = 0,
  });

  MainState copyWith({
    pageState? state,
    int? counter,
  }) {
    return MainState(
      status: state ?? this.status,
      counter: counter ?? this.counter,
    );
  }
}
