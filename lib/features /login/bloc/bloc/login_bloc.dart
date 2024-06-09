import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:task_manager_app/features%20/login/Data/model/login-response.dart';
import 'package:task_manager_app/features%20/login/Data/repository/auth-repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late final AuthRepository authRepository;
  LoginBloc() : super(LoginInitial(LoginResponse())) {
    authRepository = AuthRepository();
    on<LoginEvent>((event, emit) async {
      if (event is LoginWithUserNameAndPassword) {
        await _loginWithUserNameAndPassword(event, emit);
      }
    });
  }
  Future<void> _loginWithUserNameAndPassword(
      LoginWithUserNameAndPassword event, Emitter<LoginState> emit) async {
    try {
      emit(LoginLoading(
        state.loginResponse,
      ));
      final user = await authRepository.loginProvider(
          username: event.userName, password: event.password);
      if (user.status == 200) {
        const storage = FlutterSecureStorage(
          aOptions: AndroidOptions(
            encryptedSharedPreferences: true,
          ),
        );
  
        await storage.write(
          key: "token",
          value: user.token!,
        );
        await storage.write(
          key: "userID", 
          value: user.id.toString(),
        );

        emit(LoginSuccess(user));
      } else {
        emit(LoginFailure("something went wrong", state.loginResponse));
      }
    } on DioException catch (e) {
      emit(LoginFailure(e.message ?? "", state.loginResponse));
    }
  }
}
