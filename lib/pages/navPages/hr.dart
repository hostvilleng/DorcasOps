
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opshr/pages/navPages/departments.dart';
import 'package:opshr/pages/navPages/employees.dart';
import 'package:opshr/pages/navPages/payrolls.dart';
import 'package:opshr/pages/navPages/teams.dart';
import 'package:opshr/shared_components/utils/helpers/app_helpers.dart';

import '../../appLoader/loader.dart';
import '../../general/widgets.dart';
import '../../otherWidgets.dart/color_constant.dart';
import '../../otherWidgets.dart/heading.dart';
import '../../shared_components/header_text.dart';
import '../otherPages/projects/project_card_tile.dart';


//final Function refreshHrScreen;
class HrScreen extends StatefulWidget {
  const HrScreen({Key key,}) : super(key: key);

  @override
  State<HrScreen> createState() => _HrScreenState();
}

class _HrScreenState extends State<HrScreen> {
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
                //Expanded(child: HeaderText(
                //  DateTime.now().formatdMMMMY(),

                // ),
                // ),


                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 8, right: 8,),
                  child: Row(
                    children: [

                      //  IconButton(
                      //  onPressed: (){
                      // Expanded(child: Container(
                      // margin: const EdgeInsets.only(top: 60,bottom: 20),
                      //decoration: BoxDecoration(color: Colors.white,

                      //boxShadow: shadowList,
                      // borderRadius: const BorderRadius.only(
                      // topRight: Radius.circular(20),
                      //    bottomRight: Radius.circular(20)

                      // )
                      //   ),

                      //),
                      //   );

                      //},

                      // icon: const Icon(
                      //Icons.arrow_back,
                      //color: Colors.grey,
                      //size: 35,
                      // ),

                      //  ),

                      HeaderText(
                       DateTime.now().formatdMMMMY(),
                       ),

                     // Text(
                        //'Welcome to Dorcas Ops, ',
                        //style: TextStyle(
                        //  fontSize: 10,
                        //  fontWeight: FontWeight.bold,
                        //  fontFamily: 'SourceSansPro',
                       // ),

                    //  ),
                      Spacer(),

                      IconButton(
                        onPressed: (){
                          Expanded(child: Container(
                            margin: const EdgeInsets.only(top: 60,bottom: 20),
                            decoration: BoxDecoration(color: Colors.white,

                                //boxShadow: shadowList,
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20)

                                )
                            ),

                          ),
                          );

                        },

                        icon: const Icon(
                          Icons.supervised_user_circle_outlined,
                          color: Colors.grey,
                          size: 35,
                        ),

                      ),



                    ],
                  ),
                ),

                Center(
                  child: Padding(

                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      '${currentuser.company.name} '+ 'Dashboard',
                      style: TextStyle(
                        fontSize: 18,
                        //color: CustomColors.kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SourceSansPro',
                      ),

                    ),
                  ),
                ),




                // SizedBox(height: 20),
                // CommonText(
                //   text: DateFormat('MMM, d, y').format(DateTime.now()),
                //   size: 17,
                //  ),

                SizedBox(height: 20),
                Container(
                  height: 199,
                  child: ListView(
                    padding: EdgeInsets.only(left:16, right: 6),
                    controller: PageController(viewportFraction: 1),
                    scrollDirection: Axis.horizontal,
                    // itemBuilder: (context, index){
                    //pageSnapping: true,
                    children: <Widget> [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 199,
                            width: 180,
                            padding: EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              color: Color(0xFF1E1E99),
                              borderRadius: BorderRadius.circular(20),),

                            child: InkWell(
                              onTap: (){
                                //
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => EmployeeScreen()));
                              },

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("Employees", style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight:FontWeight.bold,
                                        color:kWhiteColor,

                                      ),),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [

                                      Text(
                                        '${currentuser.company.employeeCount}',
                                        style: TextStyle(fontSize: 20, color: Colors.white),
                                      )
                                    ],
                                  ),

                                ],

                              ),




                            ),
                          ),

                        ],

                      ),



                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 199,
                            width: 180,
                            padding: EdgeInsets.all(30),
                            decoration: BoxDecoration(
                                color: Color(0xFFFF70A3),
                                borderRadius: BorderRadius.circular(20)),

                            child: InkWell(
                              onTap: (){
                                //
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => PayrollScreen()));
                              },




                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Payroll",
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight:FontWeight.bold,
                                          color:kWhiteColor,
                                        ),
                                      ),


                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [

                                      Text(
                                        '${currentuser.company.payrollCount}',
                                        style: TextStyle(fontSize: 20, color: Colors.white),
                                      )
                                    ],
                                  ),


                                ],
                              ),
                            ),
                          ),
                        ],
                      ),



                    ],
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                Container(
                  height: 199,
                  child: ListView(
                    padding: EdgeInsets.only(left:16, right: 6),
                    controller: PageController(viewportFraction: 1),
                    scrollDirection: Axis.horizontal,
                    // itemBuilder: (context, index){
                    //pageSnapping: true,
                    children: <Widget> [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 199,
                            width: 180,
                            padding: EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              color: Color(0xFF1E1E99),
                              borderRadius: BorderRadius.circular(20),),

                            child: InkWell(
                              onTap: (){
                                //
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => TeamScreen()));
                              },

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("Teams", style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight:FontWeight.bold,
                                        color:kWhiteColor,

                                      ),),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [

                                      Text(
                                        '${currentuser.company.teamCount}',
                                        style: TextStyle(fontSize: 20, color: Colors.white),
                                      )
                                    ],
                                  ),

                                ],

                              ),




                            ),
                          ),

                        ],

                      ),



                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 199,
                            width: 180,
                            padding: EdgeInsets.all(30),
                            decoration: BoxDecoration(
                                color: Color(0xFFFF70A3),
                                borderRadius: BorderRadius.circular(20)),

                            child: InkWell(
                              onTap: (){
                                //
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => Departments()));
                              },




                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Departments",
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight:FontWeight.bold,
                                          color:kWhiteColor,
                                        ),
                                      ),


                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [

                                      Text(
                                        '${currentuser.company.departmentCount}',
                                        style: TextStyle(fontSize: 20, color: Colors.white),
                                      )
                                    ],
                                  ),
                               // widget.refreshHrScreen();


                                ],
                              ),
                            ),
                          ),
                        ],
                      ),



                    ],
                  ),
                ),



                Heading(
                  text: Text(
                    "Project List",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  button: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: Radius.circular(8),
                      color: Colors.grey,
                      child: Center(
                        child: Icon(
                          Icons.navigate_next,
                          size: 28,
                          color: Colors.orange,
                        ),
                      ),
                      strokeWidth: 1,
                      dashPattern: [3, 4]),
                ),


                Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return ProjectCardTile();
                    },
                  ),
                ),






              ]),
        ),
      ),
    );
  }
}


class  Popup extends StatelessWidget {
  final List<PopupMenuEntry> menuList;
  final Widget icon;

  const Popup({Key key,  this.menuList, this.icon}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      itemBuilder: ((context) => menuList),
      icon: icon,);
  }
}