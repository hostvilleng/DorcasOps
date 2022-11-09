import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

import '../../otherWidgets.dart/color_constant.dart';
import '../../otherWidgets.dart/widgets.dart';
import '../otherPages/employees/addEmployees.dart';
import '../otherPages/employees/manageEmployees.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({Key key}) : super(key: key);

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  @override
    Widget build(BuildContext context) {
      return Scaffold(

          body: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Employee", style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight:FontWeight.bold,
                        color:kWhiteColor,

                      ),),


                      SizedBox(height: 20),


                      BasicItemWidget(icon: Ionicons.person_add_outline,
                        title: 'Add New Employee',
                        onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context) => AddEmployee()));
                        },),
                      MyDivider(),
                      BasicItemWidget(icon: Ionicons.people_outline,
                        title: 'Manage Employees',
                        onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => ManageEmployee()));
                        },),
                      MyDivider(),

                      MyDivider(),


                      SizedBox(height: 20,),


                    ],
                  )
              )
          )
      );
    }
  }

