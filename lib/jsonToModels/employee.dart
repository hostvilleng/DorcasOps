
import 'package:opshr/general/allExports.dart';

import '../models/employee/employee.dart';





Employee employeeJsonDataToEmployeeModel(dynamic employeeJsonData) {
  Map data = employeeJsonData;

  return Employee(
      employeeId: data['id'],
      firstName: data['firstname'],
      lastName: data['lastname'],
      gender: data['gender'],
      email: data['email'],
      phoneNumber: data['phoneNumber'],
      salaryAmount: data['salaryAmount'],
      staffCode: data['staffCode'],
      jobTitle: data['jobTitle'],


          addedOn: DateTime.parse(data['created_at']));
}

Employee mainEmployeeJsonDataToEmployeeModel(dynamic employeeJsonData) {
  Map data = employeeJsonData;

  return Employee(
      employeeId: data['data']['id'],
      firstName: data['firstname'],
      lastName: data['lastname'],
      gender: data['gender'],
      email: data['email'],
      phoneNumber: data['phoneNumber'],
      salaryAmount: data['salaryAmount'],
      staffCode: data['staffCode'],
      jobTitle: data['jobTitle'],

      addedOn: DateTime.parse(data['data']['created_at']));
}
