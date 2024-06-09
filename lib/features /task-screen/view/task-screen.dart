import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/core/constants/colors.dart';
import 'package:task_manager_app/core/widget/loading.dart';
import 'package:task_manager_app/features%20/task-screen/bloc/bloc/task_bloc.dart';
import 'package:task_manager_app/features%20/task-screen/view/widget/add-task.dart';
import 'package:task_manager_app/features%20/task-screen/view/widget/tasks-list.dart';

class TasksScreen extends StatefulWidget {
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  void initState() {
    context.read<TaskBloc>().add(const FetchTaskSEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddTasks((newTaskTitle) {}),
                    ),
                  ));
        },
        backgroundColor: Colors.indigo[400],
        child: const Icon(Icons.add),
      ),
      backgroundColor: AppColors.primaryColor,
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is FetchTasksSuccess) {
            return Container(
              padding: const EdgeInsets.only(
                  top: 60, left: 20, right: 20, bottom: 40),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.playlist_add_check,
                          color: Colors.white,
                          size: 40,
                        ),
                        Text(
                          'ToDayDo',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${state.todsResponse.todos?.length} Tasks',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: TasksList(
                          todsResponse: state.todsResponse,
                        ),
                      ),
                    )
                  ]),
            );
          } else if (state is FetchTasksFailuer) {
            return Text(
              state.failure,
              style: TextStyle(color: Colors.white, fontSize: 18),
            );
          } else if (state is FetchTasksLoading) {
            return Center(
              child: LoadingWidget(),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
