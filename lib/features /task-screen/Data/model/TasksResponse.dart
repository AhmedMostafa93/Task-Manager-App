// To parse this JSON data, do
//
//     final tasksResponse = tasksResponseFromJson(jsonString);

import 'dart:convert';

TodsResponse tasksResponseFromJson(String str, int status) =>
    TodsResponse.fromJson(json.decode(str), status);

class TodsResponse {
  List<Todo>? todos;
  int? total;
  String? skip;
  int? limit;
  int? status;

  TodsResponse({this.todos, this.total, this.skip, this.limit, this.status});

  factory TodsResponse.fromJson(Map<String, dynamic> json, status) =>
      TodsResponse(
          todos: json["todos"] == null
              ? []
              : List<Todo>.from(json["todos"]!.map((x) => Todo.fromJson(x))),
          total: json["total"],
          skip: json["skip"],
          limit: json["limit"],
          status: status);
}

class Todo {
  int? id;
  String? todo;
  bool? completed;
  int? userId;

  Todo({
    this.id,
    this.todo,
    this.completed,
    this.userId,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json["id"],
        todo: json["todo"],
        completed: json["completed"],
        userId: json["userId"],
      );
}
