import 'package:task_manager_app/core/constants/api-const.dart';
import 'package:task_manager_app/core/networking/network_service.dart';
import 'package:task_manager_app/core/utilities/storage_helper.dart';
import 'package:task_manager_app/features%20/task-screen/Data/model/TasksResponse.dart';
import 'package:task_manager_app/features%20/task-screen/Data/provider/task-provider.dart';

class TaskRepository {
  late final TaskProvider taskProvider;

  TaskRepository() {
    final ApiHelper apiHelper = ApiHelper();
    taskProvider = TaskProvider(apiHelper);
  }
  late final int userID;
  Future _getUserID() async {
    userID = int.parse(await StorageHelper.readFromSecureStorage(
        ApiConstants.userIdAttribute));
    return userID;
  }

  Future<int?> addTask({
    final String? taskDescraption,
  }) async {
    // userID = await _getUserID();
    final response = await taskProvider.addTaskProvider(
        taskDescraption: taskDescraption, userID: 5);
    print("response");
    print(response.statusCode);

    return response.statusCode;
  }

  Future<TodsResponse?> getTasks() async {
    final response = await taskProvider.getTasksProvider();

    return TodsResponse.fromJson(response.data, response.statusCode);
  }
}
