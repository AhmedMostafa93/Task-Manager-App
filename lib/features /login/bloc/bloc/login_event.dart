part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginWithUserNameAndPassword extends LoginEvent {
  final String userName;
  final String password;
  LoginWithUserNameAndPassword(
      {required this.userName, required this.password});
}
