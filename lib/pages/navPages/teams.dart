import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

import '../../otherWidgets.dart/color_constant.dart';
import '../../otherWidgets.dart/widgets.dart';
import '../otherPages/employees/addEmployees.dart';
import '../otherPages/employees/manageEmployees.dart';
import '../otherPages/teams/addTeams.dart';
import '../otherPages/teams/manageTeams.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({Key key}) : super(key: key);

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
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
                    Text("Teams", style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight:FontWeight.bold,
                      color:kWhiteColor,

                    ),),


                    SizedBox(height: 20),


                    BasicItemWidget(icon: Ionicons.person_add_outline,
                      title: 'Add New Team',
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AddTeam()));
                      },),
                    MyDivider(),
                    BasicItemWidget(icon: Ionicons.people_outline,
                      title: 'Manage Team',
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ManageTeams()));
                      },),
                    MyDivider(),




                    SizedBox(height: 20,),


                  ],
                )
            )
        )
    );
  }
}