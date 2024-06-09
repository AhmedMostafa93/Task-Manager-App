import 'package:flutter/material.dart';
import 'package:task_manager_app/features%20/task-screen/Data/model/TasksResponse.dart';
import 'package:task_manager_app/features%20/task-screen/view/widget/TaskTile.dart';

class TasksList extends StatefulWidget {
  final TodsResponse todsResponse;

  const TasksList({required this.todsResponse});
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return
      
        ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: widget.todsResponse.todos![index].todo ?? "",
          isChecked: true,
          checkBoxChange: (newValue) {
            // taskdata.updateTask(taskdata.task[index]);
          },
          removeTask: () {
            // taskdata.removeTask(taskdata.task[index]);
          },
        );
      },
      itemCount: widget.todsResponse.todos!.length,
    );
  }
}
//     );
//   }
// }