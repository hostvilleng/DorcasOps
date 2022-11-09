import 'package:google_fonts/google_fonts.dart';
import 'package:opshr/general/allExports.dart';

import '../../../jsonToModels/employee.dart';
import '../../../otherWidgets.dart/color_constant.dart';


List<Employee> allEmployees = [];

TextEditingController _firstNameController = TextEditingController();
TextEditingController _lastNameController = TextEditingController();
TextEditingController _genderController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _phoneNumberController = TextEditingController();
TextEditingController _baseSalaryController = TextEditingController();
TextEditingController _employeeCodeController = TextEditingController();
TextEditingController _jobTitleController = TextEditingController();


class AddEmployee extends StatefulWidget {
  final Function refreshEmployeesPage;
  const AddEmployee({Key key, @required this.refreshEmployeesPage}) : super(key: key);

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
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
                    ),
                    //common space
                    Text("Add New Employee", style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight:FontWeight.bold,
                      color:Colors.black,

                    ),),


                    SizedBox(height: 20),

                    //data form

                    Container(
                      constraints: BoxConstraints(maxWidth: 700),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("FirstName", style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight:FontWeight.bold,
                              color:Colors.black,

                            ),),
                            SizedBox(height: 12),
                            CommonTextFieldSmall(
                              controller: _firstNameController,
                              hintText: '',
                            ),

                            SizedBox(
                              height: 20,
                            ), //common space

                            Text("LastName:", style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight:FontWeight.bold,
                              color:Colors.black,

                            ),),
                            SizedBox(height: 12),
                            CommonTextFieldSmall(
                              controller: _lastNameController,
                              hintText: '',
                             // enabled: false,
                            ),

                            SizedBox(
                              height: 20,
                            ), //common space

                            Text("Gender", style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight:FontWeight.bold,
                              color:Colors.black,

                            ),),
                            SizedBox(height: 12),
                            CommonTextFieldSmall(
                              controller: _genderController,
                              hintText: '',
                              //onlyNumbers: true,
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
                            ), //common space

                            //add button

                            Align(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () async {
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
                                      mainEmployeeJsonDataToEmployeeModel(employeeJsonData)
                                    );

                                    //allEmployees.add(
                                       // mainEmployeeJsonDataToEmployeeModel(
                                          //  employeeJsonData));


                                    _firstNameController.clear();
                                    _lastNameController.clear();
                                    _genderController.clear();
                                    _emailController.clear();
                                    _employeeCodeController.clear();
                                    _phoneNumberController.clear();
                                    _baseSalaryController.clear();
                                    _jobTitleController.clear();



                                    showSnackLong(context,
                                        'Employee Successfully Added', false);
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
