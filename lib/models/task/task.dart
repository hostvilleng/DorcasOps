import 'package:opshr/general/allExports.dart';

class Task {

  //
  final String taskId;
  final String task;
  final String task_description;
  final String priority;
  final String start_date;
  final String end_date;
  final DateTime addedOn;

  //
  // final String noteAbout;
  Task(
      {this.taskId, @required this.task, @required this.task_description,@required this.priority,@required this.start_date,@required this.end_date, @required this.addedOn,});
}