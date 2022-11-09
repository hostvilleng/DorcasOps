// function to convert departmentJsonData to  department Model

import 'package:opshr/general/allExports.dart';




Department departmentJsonDataToDepartmentModel(dynamic departmentJsonData) {
dynamic data = departmentJsonData;

  return Department(
      departmentId: data['id'],
      name: data['name'],
      description: data['description'],
      addedOn: DateTime.parse(data['created_at']));
}

Department mainDepartmentJsonDataToDepartmentModel(dynamic departmentJsonData) {
   Map data = departmentJsonData;

  return Department(
      departmentId: data['id'],
      name: data['name'],
      description: data['description'],
      addedOn: DateTime.parse(data['data']['created_at']));
}

