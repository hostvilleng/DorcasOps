import 'package:google_fonts/google_fonts.dart';
import 'package:opshr/general/allExports.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../../otherWidgets.dart/color_constant.dart';


Function refreshDepartmentPage;

class ManageDepartments extends StatefulWidget {
  @override
  _ManageDepartmentsState createState() => _ManageDepartmentsState();
}

class _ManageDepartmentsState extends State<ManageDepartments> {
  @override
  Widget build(BuildContext context) {

    refreshDepartmentPage = () {

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
                  text: 'Manage Department',
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



                       // DepartmentWidget(departmentData: Department(name: 'department', description: 'westt', addedOn: DateTime.now(), noteAbout: 'Thank GOD.', ),),

                        Column(
                            children: allDepartments.map((department) {
                              return DepartmentWidget(departmentData: department);
                            }).toList()


                        ),


                      ]),
                )
              ],
            ))));
  }
}


class DepartmentWidget extends StatelessWidget {

  final Department departmentData;

  const DepartmentWidget({Key key, this.departmentData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(

        onTap: () {

          Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DepartmentProfile(departmentData: departmentData)));
          

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
          width: MediaQuery.of(context).size.width - 24,
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
                    
                    CommonTextWithMaxLines(
                      text: departmentData.name.toUpperCase(),
                      size: 20,
                      color: AppColors().black,
                      maxLines: 1,
                    ),
      
                    SizedBox(height: 12.5,),
      
                    CommonText(
                      text: departmentData.description,
                      size: 18,
                      color: AppColors().grey,
                    ),
                   // CommonText(
                    //  text: 'Added on ' + DateFormat('MMM, d, y').format(departmentData.addedOn),
                     // size: 18,
                    //  color: AppColors().grey,
                  //  ),
      
                    SizedBox(height: 12.5,),
      
                    CommonText(
                      text: 'Tap for more info',
                      size: 15,
                      color: AppColors().blueAcc,
                    ),
      
                  ],
                ),
              ),
      

            ],
          ),
        ),
      ),
    );
  }
}
