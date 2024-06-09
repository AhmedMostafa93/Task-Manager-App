import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:task_manager_app/core/constants/api-const.dart';
import 'package:task_manager_app/core/networking/network_service.dart';

class TaskProvider {
  final ApiHelper apiHelper;

  TaskProvider(this.apiHelper);

  Future<Response> addTaskProvider({
    final String? taskDescraption,
    final int? userID,
  }) async {
    return await apiHelper.post(
      ApiConstants.addTask,
      json.encode(
          {"todo": taskDescraption, "completed": false, "userId": userID}),
    );
  }

  Future<Response> getTasksProvider() async {
    return await apiHelper.get(
      "${ApiConstants.getTasks}limit=3&skip=10",
    );
  }
}
