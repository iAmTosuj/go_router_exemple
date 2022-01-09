import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state_state.dart';

class AuthStateCubit extends Cubit<AuthStateState> {
  AuthStateCubit() : super(const AuthStateState());

  void setAuth() {
    emit(state.copyWith(isUserAuth: true));
  }

  void setAppInit() {
    emit(state.copyWith(isAppInit: true));
  }
}
