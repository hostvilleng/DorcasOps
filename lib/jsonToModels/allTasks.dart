import 'package:opshr/general/allExports.dart';

import '../models/task/task.dart';
//import '../pages/otherPages/tasks/model/addTasks.dart';
import 'task.dart';


List<Task> allTasksJsonDataToIndividualTaskModel(
    dynamic tasksJsonData) {
  Map data = tasksJsonData;

  List allTasksJsonData = data['data'];

  for (var i = 0; i < allTasksJsonData.length; i++) {
    //allTasks.add(taskJsonDataToTaskModel(allTasksJsonData[i]));
    //allTasks.add(taskJsonDataToTaskModel(allTasksJsonData[i]));
  }

  //return allTasks;
}