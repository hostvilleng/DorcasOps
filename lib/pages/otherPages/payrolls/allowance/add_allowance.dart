import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../apiRequests/requests.dart';
import '../../../../general/colors.dart';
import '../../../../general/functions.dart';
import '../../../../general/widgets.dart';
import '../authority/authority_payroll.dart';

/*List<String> _accountType = [
  'High',
  'Medium ',
  'Low',
];*/

List<String> allowanceType =[
  'Benefit',
  'Deduction',
];

//String _currentPayrollSelectedFromPayrollList = allPayrolls[1].authority_name;

List<String> selectAuth =[

];


List<String> allowanceModel =[
  'Percentage of Base',
  'Fixed',
  'Computational',
];
class AddAllowance extends StatefulWidget {
  final Function refreshAllowancePage;
  const AddAllowance({Key key, this.refreshAllowancePage}) : super(key: key);

  @override
  State<AddAllowance> createState() => _AddAllowanceState();
}

class _AddAllowanceState extends State<AddAllowance> {

  TextEditingController _allowanceNameController = TextEditingController();


  GlobalKey<FormState> fromKey = GlobalKey<FormState>();

  //bool _invoiceReminderValue = false;

  String allowanceStatus;
  String allowanceMode;
  String authoritiesName;

  @override
  void dispose() {
    _allowanceNameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 60, 10, 0),
            child: Form(
              key: fromKey,
              child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 24,
                                color: Colors.black,
                              )),

                          SizedBox(
                            width: 100,
                          ),

                          Text("Add New Allowance", style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,

                          ),),
                        ],


                      ),


                      //common space



                      SizedBox(height: 50),

                      //data form

                      Container(
                        constraints: BoxConstraints(maxWidth: 700),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              TextFormField(
                                validator: (value) {
                                  if (_allowanceNameController.text.isEmpty) {
                                    return "This field can't be empty";
                                  }else{
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  //hintText: "Short Description:",
                                  labelText: 'Name:',
                                  labelStyle: TextStyle(fontSize: 12,color: Colors.black),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(13)
                                  ),
                                ),

                                // minLines: null,
                                //maxLines: null,
                                // If this is null, there is no limit to the number of lines, and the text container will start with enough vertical space for one line and automatically grow to accommodate additional lines as they are entered.
                                //expands:
                                //true, // If
                                controller: _allowanceNameController,
                              ),

                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(border:Border.all(
                                    color: Colors.black54, width: 1.0),
                                    borderRadius: BorderRadius.circular(13)
                                ),
                                padding: EdgeInsets.only( right: 15, top: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      child:DropdownButtonHideUnderline(
                                        child: ButtonTheme(
                                          alignedDropdown: true,
                                          child: DropdownButton(
                                            items: allPayrolls.map((payroll) => DropdownMenuItem(
                                              child: Text(
                                                payroll.authority_name,
                                                style: TextStyle(color: Colors.black,
                                                  fontSize: 12,),
                                              ),
                                              value: payroll,
                                            )).toList(),

                                            onChanged: (selectedAccountType) {
                                             // print('$selectedAccountType');
                                              setState(() {
                                               // _currentPayrollSelectedFromPayrollList = selectedAccountType;
                                              });
                                            },
                                           // value: _currentPayrollSelectedFromPayrollList,
                                            isExpanded: false,
                                            hint: Text(
                                              'Select Authorities (optional)',
                                              style: TextStyle(color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),

                              Container(
                                decoration: BoxDecoration(border:Border.all(
                                    color: Colors.black54, width: 1.0),
                                    borderRadius: BorderRadius.circular(13)
                                ),
                                padding: EdgeInsets.only( right: 15, top: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      child:DropdownButtonHideUnderline(
                                        child: ButtonTheme(
                                          alignedDropdown: true,
                                          child: DropdownButton(
                                            items: allowanceType.map((value) => DropdownMenuItem(
                                              child: Text(
                                                value,
                                                style: TextStyle(color: Colors.black,
                                                  fontSize: 14,),
                                              ),
                                              value: value,
                                            )).toList(),

                                            onChanged: (selectedAccountType) {
                                              print('$selectedAccountType');
                                              setState(() {
                                                allowanceStatus = selectedAccountType;
                                              });
                                            },
                                            value: allowanceStatus,
                                            isExpanded: false,
                                            hint: Text(
                                              'Select Allowance Type',
                                              style: TextStyle(color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(
                                height: 10,
                              ),

                              Container(
                                decoration: BoxDecoration(border:Border.all(
                                    color: Colors.black54, width: 1.0),
                                    borderRadius: BorderRadius.circular(13)
                                ),
                                padding: EdgeInsets.only( right: 15, top: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      child:DropdownButtonHideUnderline(
                                        child: ButtonTheme(
                                          alignedDropdown: true,
                                          child: DropdownButton(
                                            items: allowanceModel.map((value) => DropdownMenuItem(
                                              child: Text(
                                                value,
                                                style: TextStyle(color: Colors.black,
                                                  fontSize: 14,),
                                              ),
                                              value: value,
                                            )).toList(),

                                            onChanged: (selectedAccountType) {
                                              print('$selectedAccountType');
                                              setState(() {
                                                allowanceMode = selectedAccountType;
                                              });
                                            },
                                            value: allowanceMode,
                                            isExpanded: false,
                                            hint: Text(
                                              'Select Allowance Model',
                                              style: TextStyle(color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(
                                height: 20,
                              ),








                              //add button

                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: GestureDetector(
                                    onTap: () async {
                                      //if(fromKey.currentState.validate()){
                                        //log(_allowanceNameController.text);
                                       // log(allowanceType.name);
                                      //  log(allowanceStatus.name);
                                       // log(_start_dateController.text);
                                     //   log(_end_dateController.text);

                                       // dynamic payrollJsonData = await ApiRequests().payrollAllowance(
                                         //   allowance_name: _allowanceNameController.text,
                                         //   authority_name:
                                          //  allowance_type: allowanceType.name,
                                              //model:allowanceMode,
                                         //

                                      //  );

                                       // if(payrollJsonData == false){
                                          //showSnackLong(context, 'Error', true);
                                       // }else{
                                        //  _allowanceNameController.clear();

                                          //showSnackLong(context, 'Task Successfully Added', false);
                                        //}


                                        // allTasks.add(
                                        //    mainTaskJsonDataToTaskModel(
                                        //       taskJsonData));

                                        // widget.refreshTeamsPage();
                                        // Navigator.pop(context);
                                     // }

                                    },
                                    child:Container(
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(20))),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 120, vertical: 18),
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
                  )),
            )));
  }
}
