import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/core/constants/colors.dart';
import 'package:task_manager_app/core/widget/loading.dart';
import 'package:task_manager_app/features%20/task-screen/bloc/bloc/task_bloc.dart';

class AddTasks extends StatefulWidget {
  final Function addTask;
  AddTasks(this.addTask);

  @override
  State<AddTasks> createState() => _AddTasksState();
}

class _AddTasksState extends State<AddTasks> {
  TextEditingController taskDescraption = TextEditingController();
  late final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskBloc, TaskState>(
      listener: (context, state) {
        if (state is AddTaskSuccess) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Add Task',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.indigo[400],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    autofocus: true,
                    textAlign: TextAlign.center,
                    controller: taskDescraption,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Text is empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  state is AddTaskLoading
                      ? const Center(
                          child: LoadingWidget(),
                        )
                      : TextButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() == true) {
                              context.read<TaskBloc>().add(AddTaskEvent(
                                  taskDescraption: taskDescraption.text));
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                          ),
                          child: const Text(
                            'Add',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                ]),
          ),
        );
      },
    );
  }
}
