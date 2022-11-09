import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../apiRequests/requests.dart';
import '../../../../general/colors.dart';
import '../../../../general/functions.dart';
import '../../../../general/widgets.dart';
import '../../../../jsonToModels/payroll.dart';
import '../../../../models/payroll/payroll.dart';
import 'authority_payroll.dart';


List<String> paymentModeStatusList =[
  'flutterwave',
  'paystack',
];
class AuthorityUpdate extends StatefulWidget {
  final String id;
  const AuthorityUpdate({Key key, this.id}) : super(key: key);

  @override
  State<AuthorityUpdate> createState() => _AuthorityUpdateState();
}

class _AuthorityUpdateState extends State<AuthorityUpdate> {

  TextEditingController _authorityNameController = TextEditingController();
  TextEditingController _paymentDetailsController = TextEditingController();
  TextEditingController _paymentAccountController = TextEditingController();

  GlobalKey<FormState> fromKey = GlobalKey<FormState>();


  String projectStatus;
  var editRequest;

  @override
  void initState() {
    editRequest = ApiRequests().updatePayroll(widget.id);
    super.initState();
  }

  @override
  void dispose() {
    _authorityNameController.dispose();
    _paymentDetailsController.dispose();
    _paymentAccountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
            child: Form(
              key: fromKey,
              child: FutureBuilder(
                future: editRequest,
                builder:(context, snapshot) {
                  //wait for data to come
                  if(snapshot.data == null || snapshot.connectionState == ConnectionState.waiting){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final data = snapshot.data;

                  if(data is bool && data == false){
                    return Center(child: Text("Error"));
                  }

                  _authorityNameController.value= TextEditingValue(text: data['data']['name'] ?? '');
                  _paymentDetailsController.value= TextEditingValue(text: data['data']['description'] ?? '');
                  _paymentAccountController.value= TextEditingValue(text: data['data']['description'] ?? '');

                  return SingleChildScrollView(
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
                          ),
                          //common space
                          Text("Update Payroll Authorities", style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,

                          ),),


                          SizedBox(height: 20),

                          //data form

                          Container(
                            constraints: BoxConstraints(maxWidth: 700),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  TextFormField(
                                    validator: (value) {
                                      if (_authorityNameController.text.isEmpty) {
                                        return "This field can't be empty";
                                      }else{
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      //hintText: "Short Description:",
                                      labelText: 'Name:',
                                      labelStyle: TextStyle(fontSize: 12,color: Colors.blueAccent),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(13)
                                      ),
                                    ),

                                    // minLines: null,
                                    //maxLines: null,
                                    // If this is null, there is no limit to the number of lines, and the text container will start with enough vertical space for one line and automatically grow to accommodate additional lines as they are entered.
                                    //expands:
                                    //true, // If
                                    controller: _authorityNameController,
                                  ),

                                  SizedBox(
                                    height: 20,
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: DropdownButton(
                                          items: paymentModeStatusList.map((value) => DropdownMenuItem(
                                            child: Text(
                                              value,
                                              style: TextStyle(color: Colors.blueAccent,
                                                fontSize: 12,),
                                            ),
                                            value: value,
                                          )).toList(),

                                          onChanged: (selectedAccountType) {
                                            print('$selectedAccountType');
                                            setState(() {
                                              projectStatus = selectedAccountType;
                                            });
                                          },
                                          value: projectStatus,
                                          isExpanded: false,
                                          hint: Text(
                                            'Choose Project Status',
                                            style: TextStyle(color: Colors.blueAccent),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(
                                    height: 20,
                                  ),

                                  TextFormField(
                                    validator: (value) {
                                      if (_paymentDetailsController.text.isEmpty) {
                                        return "This field can't be empty";
                                      }else{
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      //hintText: "Short Description:",
                                      labelText: 'Payment Details:',
                                      labelStyle: TextStyle(fontSize: 12,color: Colors.blueAccent),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(13)
                                      ),
                                    ),

                                    // minLines: null,
                                    //maxLines: null,
                                    // If this is null, there is no limit to the number of lines, and the text container will start with enough vertical space for one line and automatically grow to accommodate additional lines as they are entered.
                                    //expands:
                                    //true, // If
                                    controller: _paymentDetailsController,
                                  ),

                                  //priority

                                  SizedBox(
                                    height: 20,
                                  ),

                                  TextFormField(
                                    validator: (value) {
                                      if (_paymentAccountController.text.isEmpty) {
                                        return "This field can't be empty";
                                      }else{
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      //hintText: "Short Description:",
                                      labelText: 'Account Details:',
                                      labelStyle: TextStyle(fontSize: 12,color: Colors.blueAccent),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(13)
                                      ),
                                    ),

                                    // minLines: null,
                                    //maxLines: null,
                                    // If this is null, there is no limit to the number of lines, and the text container will start with enough vertical space for one line and automatically grow to accommodate additional lines as they are entered.
                                    //expands:
                                    //true, // If
                                    controller: _paymentAccountController,
                                  ),



                                  SizedBox(
                                    height: 20,
                                  ),

                                  //add button
                                  Align(
                                      alignment: Alignment.bottomCenter,
                                      child: GestureDetector(
                                        onTap: () async {
                                          // if(fromKey.currentState.validate()) {
                                          //  log(_authorityNameController.text);
                                          // log(_paymentDetailsController.text);
                                          // log(paymentStatus);
                                          dynamic payrollJsonData = await ApiRequests().payrollAuthority(
                  authority_name: _authorityNameController
                      .text,
                  default_payment_details: _paymentDetailsController
                      .text,
                  payment_mode: projectStatus,
                                            payment_details: _paymentAccountController
                      .text,
                  // addedOn: null,

                  );


                  if(payrollJsonData == false){
                  showSnackLong(context, 'Error', true);
                  }else{
                  _authorityNameController.clear();
                  _paymentDetailsController.clear();
                  _paymentAccountController.clear();

                  showSnackLong(context, 'Task Successfully Added', false);
                  }



                  },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: AppColors().mainColor,
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(20))),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 140, vertical: 20),
                                            child: CommonText(
                                              text: 'Submit',
                                              size: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )),

                                  SizedBox(
                                    height: 20,
                                  ),
                                ]),
                          )
                        ],
                      )
                  );
                },
              ),
            )));
  }
}
