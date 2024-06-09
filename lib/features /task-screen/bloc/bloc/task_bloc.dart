import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:task_manager_app/features%20/task-screen/Data/model/TasksResponse.dart';

import 'package:task_manager_app/features%20/task-screen/Data/repository/task-repository.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  late final TaskRepository taskRepository;

  TaskBloc() : super(TaskInitial(TodsResponse())) {
    taskRepository = TaskRepository();
    on<TaskEvent>((event, emit) async {
      if (event is AddTaskEvent) {
        await _addTaskEvent(event, emit);
      } else if (event is FetchTaskSEvent) {
        await _fetchTaskSEvent(event, emit);
      }
    });
  }
  Future<void> _addTaskEvent(
      AddTaskEvent event, Emitter<TaskState> emit) async {
    try {
      emit(AddTaskLoading(state.todsResponse));
      final response =
          await taskRepository.addTask(taskDescraption: event.taskDescraption);
      if (response == 201) {
        emit(AddTaskSuccess(state.todsResponse));
      } else {
        emit(AddTaskFailuer("something went wrong", state.todsResponse));
      }
    } on DioException catch (e) {
      emit(AddTaskFailuer(e.message ?? "", state.todsResponse));
    }
  }

  Future<void> _fetchTaskSEvent(
      FetchTaskSEvent event, Emitter<TaskState> emit) async {
    try {
      emit(FetchTasksLoading(state.todsResponse));
      final response = await taskRepository.getTasks();
      if (response == 200) {
        emit(FetchTasksSuccess(response!));
      } else {
        emit(FetchTasksFailuer("something went wrong", state.todsResponse));
      }
    } on DioException catch (e) {
      emit(FetchTasksFailuer(e.message ?? "", state.todsResponse));
    }
  }
}
