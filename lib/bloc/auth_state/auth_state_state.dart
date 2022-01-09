part of 'auth_state_cubit.dart';

class AuthStateState extends Equatable {
  final bool isAppInit;
  final bool isUserAuth;

  const AuthStateState({
    this.isAppInit = false,
    this.isUserAuth = false,
  });

  @override
  List<Object> get props => [
        isAppInit,
        isUserAuth,
      ];

  AuthStateState copyWith({
    bool? isAppInit,
    bool? isUserAuth,
  }) {
    return AuthStateState(
      isAppInit: isAppInit ?? this.isAppInit,
      isUserAuth: isUserAuth ?? this.isUserAuth,
    );
  }
}
