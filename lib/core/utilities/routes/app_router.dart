// import 'package:flutter/material.dart';
// import 'package:task_manager_app/routes/pages.dart';

// Route onGenerateRoute(RouteSettings routeSettings) {
//   switch (routeSettings.name) {
//     case Pages.initial:
//       return MaterialPageRoute(
//         builder: (context) => const SplashScreen(),
//       );
//     case Pages.home:
//       return MaterialPageRoute(
//         builder: (context) => const TasksScreen(),
//       );
//     case Pages.createNewTask:
//       return MaterialPageRoute(
//         builder: (context) => const NewTaskScreen(),
//       );
//     case Pages.updateTask:
//       final args = routeSettings.arguments as TaskModel;
//       return MaterialPageRoute(
//         builder: (context) => UpdateTaskScreen(taskModel: args),
//       );
//     default:
//       return MaterialPageRoute(
//         builder: (context) => const PageNotFound(),
//       );
//   }
// }
