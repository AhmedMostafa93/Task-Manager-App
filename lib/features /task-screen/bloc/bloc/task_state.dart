part of 'task_bloc.dart';

class TaskState extends Equatable {
  final TodsResponse todsResponse;
  const TaskState(this.todsResponse);

  @override
  List<Object> get props => [todsResponse];
}

final class TaskInitial extends TaskState {
  @override
  List<Object> get props => [super.todsResponse];
  const TaskInitial(super.tasksResponse);
}

final class AddTaskLoading extends TaskState {
  @override
  List<Object> get props => [super.todsResponse];
  const AddTaskLoading(super.tasksResponse);
}

final class AddTaskSuccess extends TaskState {
  const AddTaskSuccess(super.tasksResponse);
  @override
  List<Object> get props => [super.todsResponse];
}

class AddTaskFailuer extends TaskState {
  final String failure;
  const AddTaskFailuer(this.failure, super.tasksResponse);
  @override
  List<Object> get props => [super.todsResponse];
}

final class FetchTasksLoading extends TaskState {
  @override
  List<Object> get props => [super.todsResponse];
  const FetchTasksLoading(super.tasksResponse);
}

final class FetchTasksSuccess extends TaskState {
  @override
  List<Object> get props => [super.todsResponse];
  const FetchTasksSuccess(super.tasksResponse);
}

class FetchTasksFailuer extends TaskState {
  final String failure;
  const FetchTasksFailuer(this.failure, super.tasksResponse);
  @override
  List<Object> get props => [super.todsResponse];
}
