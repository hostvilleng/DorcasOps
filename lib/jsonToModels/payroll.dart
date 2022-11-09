

import 'package:opshr/general/allExports.dart';


Payroll payrollJsonDataToPayrollModel(dynamic payrollJsonData) {
  dynamic data = payrollJsonData;

  return Payroll(
    authority_name_Id : data['id'],
      authority_name: data['authority_name'],
      payment_mode: data['payment_mode'],
      default_payment_details: data['default_payment_details'],
    payment_details: data['default_payment_account'],
      addedOn: DateTime.parse(data['created_at']),);


}

Payroll mainPayrollJsonDataToPayrollModel(dynamic payrollJsonData) {
  Map data = payrollJsonData;

  return Payroll(
    authority_name_Id: data['id'],
    authority_name: data['data']['authority_name'],
    payment_mode: data['data']['payment_mode'],
    default_payment_details: data['data']['default_payment_details'],
    payment_details: data['data']['default_payment_account'],
    addedOn: DateTime.parse(data['data']['created_at']),);
}
