import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:opshr/pages/otherPages/employees/addEmployees.dart';
//import 'package:opshr/pages/otherPages/employees/employeeProfile.dart';


import '../../../general/colors.dart';
import '../../../general/widgets.dart';
import '../../../models/employee/employee.dart';
import '../../../otherWidgets.dart/color_constant.dart';
import '../employeeProfile/employeeProfile.dart';



List<Employee> employee = [];

Function refreshEmployeesPage;

class ManageEmployee extends StatefulWidget {
  const ManageEmployee({Key key}) : super(key: key);

  @override
  State<ManageEmployee> createState() => _ManageEmployeeState();
}

class _ManageEmployeeState extends State<ManageEmployee> {
  @override
  Widget build(BuildContext context) {

    refreshEmployeesPage = () {

      setState(() {

      });

    };

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
                      text: 'Manage Employees',
                      size: 24,
                      color: AppColors().black,
                      bold: true,
                    ),

                    SizedBox(height: 20),

                   // Align(
                       // alignment: Alignment.centerRight,
                       // child: CommonTextButton(text: 'Add Employee',
                        //  onTapped: () {
                        //    Navigator.push(
                         //       context,
                        //        MaterialPageRoute(
                         //           builder: (context) => AddEmployee(refreshEmployeesPage:  refreshEmployeesPage,)));
                       //   },
                      //  )
                    //),

                    SizedBox(height: 20),

                    //data form

                    Container(
                      constraints: BoxConstraints(maxWidth: 700),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [


                            Column(
                                children: allEmployees.map((employee) {
                                  return EmployeeWidget(employeeData: employee);
                                }).toList())

                          ]),
                    )
                  ],
                ))));
  }
}


class EmployeeWidget extends StatelessWidget {

  final Employee employeeData;

  const EmployeeWidget({Key key, this.employeeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(

        onTap: () {

          Navigator.push(
             context,
            MaterialPageRoute(
                  builder: (context) => EmployeeProfileScreen(employeeData: employeeData)));




        },

        child: Container(
          margin: EdgeInsets.only(bottom: 25),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: AppColors().textWhite,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(color: AppColors().blandGrey, offset: Offset(1, 2)),
                BoxShadow(color: AppColors().blandGrey, offset: Offset(-2, 1)),
              ]
          ),
          //width: MediaQuery.of(context).size.width - 24,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


              Container(
                width: MediaQuery.of(context).size.width - 70, //this way i am leaving a width of 50px for the forward icon
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      '${employeeData.firstName+ ' ' + employeeData.lastName}'.toUpperCase(),
                      style: TextStyle(

                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors().black,

                      ),
                      maxLines: 1,
                    ),

                    SizedBox(height: 12.5,),

                   // CommonText(
                    //  text: employeeData.lastName,
                    //  size: 18,
                    //  color: AppColors().grey,
                   // ),
                    CommonText(
                      text: employeeData.gender,
                      size: 18,
                      color: AppColors().grey,
                    ),
                    CommonText(
                      text: employeeData.email,
                      size: 18,
                      color: AppColors().grey,
                    ),

                    //CommonText(
                     // text: employeeData.phoneNumber.toString(),
                      //size: 18,
                      //color: AppColors().grey,
                   // ),

                    //CommonText(
                    // text: employeeData.salaryAmount.toString(),
                      //size: 18,
                     // color: AppColors().grey,
                  // ),

                   // CommonText(
                     // text: employeeData.staffCode.toString(),
                      //size: 18,
                     // color: AppColors().grey,
                   //),

                //CommonText(
                   //   text: employeeData.jobTitle,
                   //   size: 18,
                  //   color: AppColors().grey,
                  //  ),

                    //CommonText(
                    //  text: 'Added on ' + DateFormat('MMM, d, y').format(employeeData.addedOn),
                     // size: 18,
                    //  color: AppColors().grey,
                    //),

                    SizedBox(height: 12.5,),

                    CommonText(
                      text: 'Tap for more info',
                      size: 15,
                      color: AppColors().blueAcc,
                    ),

                  ],
                ),
              ),


              Icon(
                CupertinoIcons.forward,
                size: 24,
                color: AppColors().mainColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
