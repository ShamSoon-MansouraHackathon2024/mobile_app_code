import 'package:equatable/equatable.dart';


enum AuthStates {homeInitial, loginLoading, loginSuccess, loginError}
class AuthState extends Equatable
{
  final AuthStates? currentState;
  final String? errorMsg;

  const AuthState({
    this.currentState,
    this.errorMsg
  });

  factory AuthState.initial(){
    return const AuthState(
        currentState : AuthStates.homeInitial,
        errorMsg : ''
    );
  }

  AuthState copyWith({
    required AuthStates state,
    String? errorMessage
  })
  {
    return AuthState(
      currentState: state,
      errorMsg: errorMessage?? errorMsg,
    );
  }

  @override
  List<Object?> get props => [currentState, errorMsg];
}