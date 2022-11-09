//import 'dart:convert';

//import 'package:opshr/general/allExports.dart';
import '../models/task/task.dart';
import 'package:opshr/jsonToModels/task.dart';



Task taskJsonDataToTaskModel(dynamic taskJsonData) {
  dynamic data = taskJsonData;

  return Task(
      taskId: data['id'],
      task: data['task'],
      task_description: data['task_description'],
      priority: data['priority'],
      start_date: data['start_date'],
      end_date: data['end_date'],
      addedOn: DateTime.parse(data['created_at']));
}

Task mainTaskJsonDataToTaskModel(dynamic taskJsonData) {
  Map data = taskJsonData;

  return Task(
      taskId: data['id'],
      task: data['data']['task'],
      task_description: data['data']['task_description'],
      priority: data['data']['priority'],
      start_date: data['data']['start_date'],
      end_date: data['data']['end_date'],
      addedOn: DateTime.parse(data['data']['created_at']));


}
