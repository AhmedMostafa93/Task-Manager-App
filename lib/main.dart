import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/features%20/login/bloc/bloc/login_bloc.dart';
import 'package:task_manager_app/features%20/login/view/login-screen.dart';
import 'package:task_manager_app/features%20/task-screen/bloc/bloc/task_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<LoginBloc>(
        create: (BuildContext context) => LoginBloc(),
      ),
      BlocProvider<TaskBloc>(
        create: (BuildContext context) => TaskBloc(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}
