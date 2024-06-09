import 'package:flutter/material.dart';
import 'package:task_manager_app/core/constants/colors.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  final bool isChecked;
  final void Function(bool?) checkBoxChange;
  final void Function() removeTask;
  TaskTile(
      {required this.taskTitle,
      required this.isChecked,
      required this.checkBoxChange,
      required this.removeTask});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        onChanged: checkBoxChange,
        value: isChecked,
        activeColor: AppColors.primaryColor,
      ),
      onLongPress: removeTask,
    );
  }
}
