// function to convert companyJsonData to User Company Model

import 'dart:convert';

import 'package:opshr/general/allExports.dart';

UserCompany userCompanyJsonDataToCompanyModel(dynamic companyJsonData) {
  Map data = companyJsonData;

  return UserCompany(
      id: data['data']['id'],
      name: data['data']['name'],
      employeeCount: data['data']['counts']['employees'],
      teamCount: data['data']['counts']['teams'],
      departmentCount: data['data']['counts']['departments']);
}
