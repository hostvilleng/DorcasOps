import 'package:flutter/material.dart';

import '../../../../apiRequests/requests.dart';
import '../../../../general/colors.dart';
import '../../../../general/functions.dart';
import '../../../../general/widgets.dart';
import '../../../../models/paygroup/paygroup.dart';


TextEditingController _groupNameController = TextEditingController();
class PaygroupUpdate extends StatefulWidget {

  final Function refreshPaygroupPage;
  final Paygroup pastPaygroupData;

  const PaygroupUpdate({Key key,@required this.refreshPaygroupPage, @required this.pastPaygroupData}) : super(key: key);

  @override
  State<PaygroupUpdate> createState() => _PaygroupUpdateState();
}

class _PaygroupUpdateState extends State<PaygroupUpdate> {

  void initState() {
    // TODO: implement initState
    super.initState();
    //_paygroupController.text = widget.pastPaygroupData;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
            child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: 24,
                          color: Colors.black,
                        )),

                    SizedBox(
                      height: 20,
                    ), //common space

                    CommonText(
                      text: 'Edit PayGroup',
                      size: 24,
                      color: AppColors().black,
                      bold: true,
                    ),

                    SizedBox(height: 20),

                    //data form

                    Container(
                      constraints: BoxConstraints(maxWidth: 700),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text:  'Name:',
                              size: 17,
                            ),
                            SizedBox(height: 12),
                            CommonTextFieldSmall(
                              controller: _groupNameController,
                              hintText: '',
                            ),

                            SizedBox(
                              height: 20,
                            ), //common space

                            //add button

                            Align(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () async {

                                    await ApiRequests().deletePaygroup(widget.pastPaygroupData.group_name_Id);
                                    //allPaygroups.remove(widget.pastPaygroupData);



                                    dynamic paygroupJsonData =
                                   // await ApiRequests().paygroupUpdate(Paygroup(
                                    //  group_name: _groupNameController.text,

                                     // addedOn: null,

                                   // ));

                                    //allPaygroups.add(
                                      //  mainPaygroupJsonDataToPaygroupModel(
                                      //      paygroupJsonData));

                                   // widget.refreshPage();

                                   // _groupNameController.clear();



                                    // Navigator.pop(context);

                                    showSnackLong(context,
                                        'Paygroup Edited Successfully', false);
                                  },
                                  child: CommonTextButtonBig(
                                      text: 'Save Paygroup', textSize: 17),
                                )),

                            SizedBox(
                              height: 20,
                            ),
                          ]),
                    )
                  ],
                ))));
  }
}
