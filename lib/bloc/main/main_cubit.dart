import 'package:bloc/bloc.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState());

  void fetch() async {
    emit(state.copyWith(state: pageState.loading));

    await Future.delayed(const Duration(seconds: 2));

    emit(state.copyWith(state: pageState.success));
  }

  void increase() async {
    emit(state.copyWith(counter: state.counter + 1));
  }
}
