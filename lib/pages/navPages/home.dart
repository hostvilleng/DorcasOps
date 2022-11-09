import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opshr/general/allExports.dart';
import 'package:intl/intl.dart';
import 'package:opshr/pages/navPages/hr.dart';
import 'package:opshr/pages/navPages/taskmanager.dart';
import 'package:opshr/shared_components/utils/helpers/app_helpers.dart';

import '../../models/card_model.dart';
import '../../otherWidgets.dart/color_constant.dart';
import '../../otherWidgets.dart/heading.dart';
import '../../shared_components/header_text.dart';
import '../otherPages/projects/project_card_tile.dart';

int _currentTipIndex = 0;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

                      //HeaderText(
                     // DateTime.now().formatdMMMMY(),
       // ),

                      Text(
                        'Welcome to Dorcas Ops, ',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SourceSansPro',
                        ),

                     ),
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

                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    '${currentuser.company.name}',
                    style: TextStyle(
                      fontSize: 20,
                      //color: CustomColors.kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceSansPro',
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
                  height: 230,
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
                            height: 230,
                            width: 180,
                            padding: EdgeInsets.all(30),
                            decoration: BoxDecoration(
                                color: Color(0xFF1E1E99),
                                borderRadius: BorderRadius.circular(20),),

                            child: InkWell(
                              onTap: (){
                                //
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => HrScreen()));
                              },

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Human Resources", style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight:FontWeight.bold,
                                    color:kWhiteColor,

                                  ),)
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
                            height: 230,
                            width: 180,
                            padding: EdgeInsets.all(30),
                            decoration: BoxDecoration(
                                color: Color(0xFFFF70A3),
                                borderRadius: BorderRadius.circular(20)),

                            child: InkWell(
                              onTap: (){
                                //
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => TaskManager()));
                              },




                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Task Manager",
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight:FontWeight.bold,
                                  color:kWhiteColor,
                                ),
                                      ),


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
                  height: 40,
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