

//import 'package:opshr/general/allExports.dart';

import '../models/paygroup/paygroup.dart';


Paygroup paygroupJsonDataToPaygroupModel(dynamic paygroupJsonData) {
  dynamic data = paygroupJsonData;

  return Paygroup(
    group_name_Id : data['id'],
    group_name: data['group_name'],
    addedOn: DateTime.parse(data['created_at']),);


}

Paygroup mainPaygroupJsonDataToPaygroupModel(dynamic paygroupJsonData) {
  Map data = paygroupJsonData;

  return Paygroup(
    group_name_Id : data['data']['id'],
    group_name: data['group_name'],
    addedOn: DateTime.parse(data['created_at']),);
}
