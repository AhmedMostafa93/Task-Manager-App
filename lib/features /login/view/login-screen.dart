import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/core/constants/colors.dart';
import 'package:task_manager_app/core/widget/loading.dart';
import 'package:task_manager_app/core/widget/text_field_wdget.dart';
import 'package:task_manager_app/core/widget/text_widget.dart';
import 'package:task_manager_app/features%20/login/bloc/bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/features%20/task-screen/view/task-screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => TasksScreen()),
              );
            } else if (state is LoginFailure) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(state.failure),
                  ),
                );
            }
          },
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 400,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/background.png'),
                            fit: BoxFit.fill)),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 30,
                          width: 80,
                          height: 200,
                          child: FadeInUp(
                              duration: const Duration(seconds: 1),
                              child: Container(
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/light-1.png'))),
                              )),
                        ),
                        Positioned(
                          left: 140,
                          width: 80,
                          height: 150,
                          child: FadeInUp(
                              duration: const Duration(milliseconds: 1200),
                              child: Container(
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/light-2.png'))),
                              )),
                        ),
                        Positioned(
                          right: 40,
                          top: 40,
                          width: 80,
                          height: 150,
                          child: FadeInUp(
                              duration: const Duration(milliseconds: 1300),
                              child: Container(
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/clock.png'))),
                              )),
                        ),
                        Positioned(
                          child: FadeInUp(
                              duration: const Duration(milliseconds: 1600),
                              child: Container(
                                margin: const EdgeInsets.only(top: 50),
                                child: Center(
                                  child: TextWidget(
                                    text: "Login",
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    textColor: Colors.white,
                                  ),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        FadeInUp(
                            duration: const Duration(milliseconds: 1800),
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: const Color.fromRGBO(
                                          143, 148, 251, 1)),
                                  boxShadow: const [
                                    BoxShadow(
                                        color:
                                            Color.fromRGBO(143, 148, 251, .2),
                                        blurRadius: 20.0,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color:
                                                    AppColors.primaryColor))),
                                    child: TextFieldWidget(
                                      textController: userNameController,
                                      hintText: "Email or Phone number",
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFieldWidget(
                                      textController: passwordController,
                                      hintText: "Password",
                                    ),
                                  )
                                ],
                              ),
                            )),
                        const SizedBox(
                          height: 30,
                        ),
                        BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            return state is LoginLoading
                                ? const Center(
                                    child: LoadingWidget(),
                                  )
                                : FadeInUp(
                                    duration:
                                        const Duration(milliseconds: 1900),
                                    child: GestureDetector(
                                      onTap: () {
                                        if (_formKey.currentState?.validate() ==
                                            true) {
                                          context.read<LoginBloc>().add(
                                              LoginWithUserNameAndPassword(
                                                  userName:
                                                      userNameController.text,
                                                  password:
                                                      passwordController.text));
                                        }
                                      },
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            gradient:
                                                const LinearGradient(colors: [
                                              Color.fromRGBO(143, 148, 251, 1),
                                              Color.fromRGBO(143, 148, 251, .6),
                                            ])),
                                        child: Center(
                                          child: TextWidget(
                                            text: "Login",
                                            fontWeight: FontWeight.bold,
                                            textColor: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ));
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
