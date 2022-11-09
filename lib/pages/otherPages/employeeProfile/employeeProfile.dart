import 'package:flutter/material.dart';

import '../../../apiRequests/requests.dart';
import '../../../general/colors.dart';
import '../../../general/functions.dart';
import '../../../general/widgets.dart';
import '../../../models/employee/employee.dart';
import '../employees/addEmployees.dart';
import '../employees/manageEmployees.dart';
import 'editEmployee.dart';


class EmployeeProfileScreen extends StatefulWidget {

  final Employee employeeData;

  const EmployeeProfileScreen({Key key, @required this.employeeData}) : super(key: key);

  @override
  State<EmployeeProfileScreen> createState() => _EmployeeProfileScreenState();
}

class _EmployeeProfileScreenState extends State<EmployeeProfileScreen> {
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
                      text: 'Employee Data',
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

                            TheHubRichText(commonTexts: [

                              CommonText(
                                text: 'Employee ID: ',
                                bold: true,
                                color: AppColors().darkGrey,
                                size: 16,
                              ),

                              CommonText(
                                text: widget.employeeData.employeeId,
                                color: Colors.black,
                                size: 18,
                              ),

                            ]),

                            SizedBox(height: 5),

                            TheHubRichText(commonTexts: [

                              CommonText(
                                text: 'First Name: ',
                                bold: true,
                                color: AppColors().darkGrey,
                                size: 16,
                              ),

                              CommonText(
                                text: widget.employeeData.firstName,
                                color: Colors.black,
                                size: 18,
                              ),

                            ]),

                            SizedBox(height: 5),

                            TheHubRichText(commonTexts: [

                              CommonText(
                                text: 'Employee LastName: ',
                                bold: true,
                                color: AppColors().darkGrey,
                                size: 16,
                              ),

                              CommonText(
                                text: widget.employeeData.lastName,
                                color: Colors.black,
                                size: 18,
                              ),

                            ]),


                            SizedBox(height: 5),

                            TheHubRichText(commonTexts: [

                              CommonText(
                                text: 'Gender: ',
                                bold: true,
                                color: AppColors().darkGrey,
                                size: 16,
                              ),

                              CommonText(
                                text: widget.employeeData.gender,
                                color: Colors.black,
                                size: 18,
                              ),

                            ]),


                            SizedBox(height: 5),

                            TheHubRichText(commonTexts: [

                              CommonText(
                                text: 'Email: ',
                                bold: true,
                                color: AppColors().darkGrey,
                                size: 16,
                              ),

                              CommonText(
                                text: widget.employeeData.email,
                                color: Colors.black,
                                size: 18,
                              ),

                            ]),


                            SizedBox(height: 5),

                            TheHubRichText(commonTexts: [

                              CommonText(
                                text: 'Phone Number: ',
                                bold: true,
                                color: AppColors().darkGrey,
                                size: 16,
                              ),

                              CommonText(
                                text: widget.employeeData.phoneNumber.toString(),
                                color: Colors.black,
                                size: 18,
                              ),

                            ]),


                            SizedBox(height: 5),

                            TheHubRichText(commonTexts: [

                              CommonText(
                                text: 'Base Salary: ',
                                bold: true,
                                color: AppColors().darkGrey,
                                size: 16,
                              ),

                              CommonText(
                                text: widget.employeeData.salaryAmount.toString(),
                                color: Colors.black,
                                size: 18,
                              ),

                            ]),


                            SizedBox(height: 5),

                            TheHubRichText(commonTexts: [

                              CommonText(
                                text: 'Employee Code Number: ',
                                bold: true,
                                color: AppColors().darkGrey,
                                size: 16,
                              ),

                              CommonText(
                                text: widget.employeeData.staffCode.toString(),
                                color: Colors.black,
                                size: 18,
                              ),

                            ]),

                            SizedBox(height: 5),

                            TheHubRichText(commonTexts: [

                              CommonText(
                                text: 'Job Title: ',
                                bold: true,
                                color: AppColors().darkGrey,
                                size: 16,
                              ),

                              CommonText(
                                text: widget.employeeData.jobTitle,
                                color: Colors.black,
                                size: 18,
                              ),

                            ]),


                            SizedBox(
                              height: 40,
                            ),

                            Align(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () {

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EditEmployee(refreshEmployeesPage: refreshEmployeesPage, pastEmployeeData: widget.employeeData,)));

                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColors().mainColor,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(7))),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 10),
                                      child: CommonText(
                                        text: 'EDIT EMPLOYEE',
                                        size: 14,
                                        color: Colors.white,
                                        alignTextCenter: true,
                                      ),
                                    ),
                                  ),
                                )),

                            SizedBox(height: 20),

                            Align(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () {

                                    showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: AppColors().white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30.0),
                                            topRight: Radius.circular(30.0),
                                          ),
                                        ),
                                        context: context,
                                        builder: (BuildContext context) {
                                          return StatefulBuilder(builder:
                                              (BuildContext context,
                                              StateSetter setState) {
                                            return CommonBottomSheetMobile(
                                              heightPercentage: 0.45,
                                              refreshMe: () => setState(() {}),
                                              topWidgets: [
                                                Center(
                                                    child:
                                                    roundedModalSheetTopSitter()),
                                              ],
                                              widgets: [
                                                SizedBox(
                                                    height: 17), //common space

                                                CommonText(
                                                  text: 'WARNING:',
                                                  size: 17,
                                                  color: Colors.grey,
                                                  bold: true,
                                                ),

                                                SizedBox(
                                                    height: 20), //common space

                                                CommonText(
                                                  text:
                                                  'Are you sure you want to delete this Employee?',
                                                ),

                                                SizedBox(
                                                    height: 20), //common space

                                                Align(
                                                    alignment: Alignment.center,
                                                    child: GestureDetector(
                                                      onTap: () async{
                                                        await ApiRequests().deleteEmployee(widget.employeeData.employeeId);
                                                        allEmployees.remove(widget.employeeData);
                                                        //refreshEmployeesPage();

                                                        showSnackLong(
                                                            context,
                                                            'Product Deleted',
                                                            true);


                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color:
                                                            AppColors().red,
                                                            borderRadius:
                                                            BorderRadius.all(
                                                                Radius
                                                                    .circular(
                                                                    7))),
                                                        child: Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .symmetric(
                                                              horizontal: 40,
                                                              vertical: 10),
                                                          child: CommonText(
                                                            text: 'DELETE',
                                                            size: 14,
                                                            color: Colors.white,
                                                            alignTextCenter: true,
                                                          ),
                                                        ),
                                                      ),
                                                    )),

                                                SizedBox(height: 10),

                                                Align(
                                                    alignment: Alignment.center,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: AppColors()
                                                                .mainColor,
                                                            borderRadius:
                                                            BorderRadius.all(
                                                                Radius
                                                                    .circular(
                                                                    7))),
                                                        child: Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .symmetric(
                                                              horizontal: 40,
                                                              vertical: 10),
                                                          child: CommonText(
                                                            text: 'CANCEL',
                                                            size: 14,
                                                            color: Colors.white,
                                                            alignTextCenter: true,
                                                          ),
                                                        ),
                                                      ),
                                                    )),
                                              ],
                                            );
                                          });
                                        });

                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColors().red,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(7))),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 10),
                                      child: CommonText(
                                        text: 'DELETE EMPLOYEE',
                                        size: 14,
                                        color: Colors.white,
                                        alignTextCenter: true,
                                      ),
                                    ),
                                  ),
                                )),

                            SizedBox(height: 20),


                          ]),
                    )
                  ],
                ))));
  }
}
