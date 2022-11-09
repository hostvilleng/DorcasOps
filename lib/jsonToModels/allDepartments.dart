// function to sieve through the list of customers


import 'package:opshr/general/allExports.dart';
//import '../pages/otherPages/departments//addDepartment.dart';
import 'department.dart';


List<Department> allDepartmentsJsonDataToIndividualDepartmentModel(
    dynamic departmentsJsonData) {
  Map data = departmentsJsonData;

  List allDepartmentsJsonData = data['data'];

  for (var i = 0; i < allDepartmentsJsonData.length; i++) {


    allDepartments.add(departmentJsonDataToDepartmentModel(allDepartmentsJsonData[i]));
  }

  return allDepartments;
}
