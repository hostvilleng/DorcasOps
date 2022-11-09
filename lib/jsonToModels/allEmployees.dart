import 'package:opshr/general/allExports.dart';

//import '../models/employee/employee.dart';
import '../pages/otherPages/employees/addEmployees.dart';
import 'employee.dart';

List<Employee> allEmployeesJsonDataToIndividualEmployeeModel(
    dynamic employeesJsonData) {
  Map data = employeesJsonData;

  List allEmployeesJsonData = data['data'];

  for (var i = 0; i < allEmployeesJsonData.length; i++) {
    allEmployees.add(employeeJsonDataToEmployeeModel(allEmployeesJsonData[i]));
  }

  return allEmployees;
}