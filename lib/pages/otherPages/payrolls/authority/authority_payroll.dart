//import 'dart:developer';

import 'package:google_fonts/google_fonts.dart';
import 'package:opshr/general/allExports.dart';




List<Payroll> allPayrolls = [

];

List<String> paymentModeStatusList =[
  'Paystack',
  'Flutterwave'
];
List<String> paymentModeStatus =[
  'Paystack',
  'Flutterwave'
];

String selectedPaymentmode = "paystack";

class AddPayrolls extends StatefulWidget {
  final Function refreshTeamsPage;
  const AddPayrolls({Key key, @required this.refreshTeamsPage}) : super(key: key);


  @override
  State<AddPayrolls> createState() => _AddPayrollsState();
}


class _AddPayrollsState extends State<AddPayrolls> {
  TextEditingController _authorityNameController = TextEditingController();
  TextEditingController _paymentDetailsController = TextEditingController();
  TextEditingController _paymentAccountController = TextEditingController();

  GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  String paymentStatus;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 60, 10, 0),
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
                          width: 110,
                        ),
                        Text("Add Authorities", style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,

                        ),),
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    //common space



                    SizedBox(height: 20),

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
                  controller: _authorityNameController,
                ),

                    //data form



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
                                  items: paymentModeStatusList.map((value) => DropdownMenuItem(

                                    child: Text(
                                      value ,
                                      style: TextStyle(color: Colors.black,
                                        fontSize: 14,),
                                    ),
                                    value: value,
                                  )).toList(),

                                  onChanged: (selectedAccountType) {
                                    print('$selectedAccountType');
                                    setState(() {
                                      paymentStatus = selectedAccountType;
                                    });
                                  },
                                  value: paymentStatus,
                                  isExpanded: false,
                                  hint: Text(
                                    'Select Payment Mode',
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
                      height: 40,
                    ),

                    Text("Payment Details:", style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,

                    ),),

                    SizedBox(height: 20),

                Container(
                    constraints: BoxConstraints(maxWidth: 700),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

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
                            //hintText: "Bank Info:",
                            labelText: 'Bank Info:',
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
                          controller: _paymentDetailsController,
                        ),]),),


                    SizedBox(height: 10),

                Container(
                  constraints: BoxConstraints(maxWidth: 700),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        TextFormField(
                          validator: (value) {
                            if ( _paymentAccountController.text.isEmpty) {
                              return "This field can't be empty";
                            }else{
                              return null;
                            }
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            //hintText: "Account Number:",
                            labelText: 'Account Number:',
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
                          controller: _paymentAccountController,
                        ),]),),



                    SizedBox(
                      height: 20,
                    ),

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
                              payment_mode: paymentStatus,
                              payment_details: _paymentAccountController
                                  .text,


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



                    //add button

                    SizedBox(
                      height: 20,
                    )
                  ],
                ))]))));
  }
}
