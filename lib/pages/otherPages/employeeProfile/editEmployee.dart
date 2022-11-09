
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../apiRequests/requests.dart';
import '../../../general/colors.dart';
import '../../../general/functions.dart';
import '../../../general/widgets.dart';
import '../../../jsonToModels/employee.dart';
import '../../../models/employee/employee.dart';
import '../employees/addEmployees.dart';



TextEditingController _firstNameController = TextEditingController();
TextEditingController _lastNameController = TextEditingController();
TextEditingController _genderController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _phoneNumberController = TextEditingController();
TextEditingController _baseSalaryController = TextEditingController();
TextEditingController _employeeCodeController = TextEditingController();
TextEditingController _jobTitleController = TextEditingController();


class EditEmployee extends StatefulWidget {

  final Function refreshEmployeesPage;
  final Employee pastEmployeeData;
  const EditEmployee({Key key, @required this.refreshEmployeesPage, @required this.pastEmployeeData}) : super(key: key);

  @override
  State<EditEmployee> createState() => _EditEmployeeState();
}

class _EditEmployeeState extends State<EditEmployee> {
  void initState() {
    // TODO: implement initState
    super.initState();

    //filling in the old details
    _firstNameController.text = widget.pastEmployeeData.firstName;
    _lastNameController.text = widget.pastEmployeeData.lastName;
    _genderController.text = widget.pastEmployeeData.gender;
    _emailController.text = widget.pastEmployeeData.email;
    _phoneNumberController.text = widget.pastEmployeeData.phoneNumber.toString();
    _baseSalaryController.text = widget.pastEmployeeData.salaryAmount.toString();
    _employeeCodeController.text = widget.pastEmployeeData.staffCode.toString();
    _jobTitleController.text = widget.pastEmployeeData.jobTitle;
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
                      text: 'Edit Employee',
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
                              text: 'FirstName:',
                              size: 17,
                            ),
                            SizedBox(height: 12),
                            CommonTextFieldSmall(
                              controller: _firstNameController,
                              hintText: '',
                            ),

                            SizedBox(
                              height: 20,
                            ), //common space

                            CommonText(
                              text: 'LastName:',
                              size: 17,
                            ),
                            SizedBox(height: 12),
                            CommonTextFieldSmall(
                              controller: _lastNameController,
                              hintText: '',
                              enabled: false,
                            ),

                            SizedBox(
                              height: 20,
                            ), //common space

                            CommonText(
                              text: 'Gender:',
                              size: 17,
                            ),
                            SizedBox(height: 12),
                            CommonTextFieldSmall(
                              controller: _genderController,
                              hintText: '',
                              onlyNumbers: true,
                            ),



                            SizedBox(
                              height: 20,
                            ),

                            SizedBox(
                              height: 20,
                            ),
                            Text("Email", style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight:FontWeight.bold,
                              color:Colors.black,

                            ),),
                            SizedBox(height: 12),
                            CommonTextFieldSmall(
                              controller: _emailController,
                              hintText: '',
                              // onlyNumbers: true,
                            ),

                            SizedBox(
                              height: 20,
                            ),


                            Text("Phone Number", style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight:FontWeight.bold,
                              color:Colors.black,

                            ),),
                            SizedBox(height: 12),
                            CommonTextFieldSmall(
                              controller: _phoneNumberController,
                              hintText: '',
                              onlyNumbers: true,
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            Text("Base Salary", style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight:FontWeight.bold,
                              color:Colors.black,

                            ),),
                            SizedBox(height: 12),
                            CommonTextFieldSmall(
                              controller: _baseSalaryController,
                              hintText: '',
                              onlyNumbers: true,
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            Text("Employee Code Number", style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight:FontWeight.bold,
                              color:Colors.black,

                            ),),
                            SizedBox(height: 12),
                            CommonTextFieldSmall(
                              controller: _employeeCodeController,
                              hintText: '',
                              // onlyNumbers: true,
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            Text("Job Title", style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight:FontWeight.bold,
                              color:Colors.black,

                            ),),
                            SizedBox(height: 12),
                            CommonTextFieldSmall(
                              controller: _jobTitleController,
                              hintText: '',
                              // onlyNumbers: true,
                            ),

                            SizedBox(
                              height: 20,
                            ),//common space

                            //add button

                            Align(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () async {

                                   await ApiRequests().deleteEmployee(widget.pastEmployeeData.employeeId);
                                    allEmployees.remove(widget.pastEmployeeData);



                                    dynamic employeeJsonData =
                                    await ApiRequests().addEmployee(Employee(
                                      firstName: _firstNameController.text,
                                      lastName: _lastNameController.text,
                                      gender: _genderController.text,
                                      email: _emailController.text,
                                      staffCode: int.parse(_employeeCodeController.text),
                                      phoneNumber: int.parse(_phoneNumberController.text),
                                      salaryAmount: int.parse(_baseSalaryController.text),
                                      jobTitle: _jobTitleController.text,

                                      addedOn: null,
                                    ));

                                    allEmployees.add(
                                       mainEmployeeJsonDataToEmployeeModel(
                                            employeeJsonData));

                                    widget.refreshEmployeesPage();

                                    _firstNameController.clear();
                                    _lastNameController.clear();
                                    _genderController.clear();
                                   _emailController.clear();
                                   _employeeCodeController.clear();
                                   _phoneNumberController.clear();
                                   _baseSalaryController.clear();
                                   _jobTitleController.clear();


                                    Navigator.pop(context);

                                    showSnackLong(context,
                                        'Employee Details Edited Successfully', false);
                                  },
                                  child: CommonTextButtonBig(
                                      text: 'Save Employee', textSize: 17),
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
