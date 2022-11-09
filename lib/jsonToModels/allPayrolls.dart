import 'package:opshr/general/allExports.dart';

import '../pages/otherPages/payrolls/authority/authority_payroll.dart';
import 'payroll.dart';

List<Payroll> allPayrollsJsonDataToIndividualPayrollModel(
    dynamic payrollsJsonData) {
  Map data = payrollsJsonData;

  List allPayrollsJsonData = data['data'];

  for (var i = 0; i < allPayrollsJsonData.length; i++) {
    allPayrolls.add(payrollJsonDataToPayrollModel(allPayrollsJsonData[i]));
  }

  return allPayrolls;
}