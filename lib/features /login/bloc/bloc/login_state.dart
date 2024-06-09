part of 'login_bloc.dart';

class LoginState extends Equatable {
  final LoginResponse loginResponse;
  const LoginState(
    this.loginResponse,
  );
  @override
  List<Object?> get props => [loginResponse];
}

final class LoginInitial extends LoginState {
  const LoginInitial(super.loginResponse);
  @override
  List<Object?> get props => [loginResponse];
}

class LoginLoading extends LoginState {
  const LoginLoading(
    super.loginResponse,
  );

  @override
  List<Object> get props => [super.loginResponse];
}

class LoginSuccess extends LoginState {
  const LoginSuccess(
    super.loginResponse,
  );

  @override
  List<Object> get props => [super.loginResponse];
}

class LoginFailure extends LoginState {
  final String failure;
  const LoginFailure(
    this.failure,
    super.loginResponse,
  );

  @override
  List<Object> get props => [failure, super.loginResponse];
}
