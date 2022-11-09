import 'package:opshr/jsonToModels/paygroup.dart';
import '../models/paygroup/paygroup.dart';


List<Paygroup> allPaygroupsJsonDataToIndividualPaygroupModel(
    dynamic paygroupsJsonData) {
  Map data = paygroupsJsonData;

  List allPaygroupsJsonData = data['data'];

  for (var i = 0; i < allPaygroupsJsonData.length; i++) {


    //allPaygroups.add(paygroupJsonDataToPaygroupModel(allPaygroupsJsonData[i]));
  }

 // return allPaygroups;
}


