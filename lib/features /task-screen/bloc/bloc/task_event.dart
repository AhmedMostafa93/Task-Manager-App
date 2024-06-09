part of 'task_bloc.dart';

class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class AddTaskEvent extends TaskEvent {
  final String taskDescraption;
  const AddTaskEvent({
    required this.taskDescraption,
  });
}

class FetchTaskSEvent extends TaskEvent {
  const FetchTaskSEvent();
}
