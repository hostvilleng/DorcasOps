import 'package:flutter/material.dart';
import 'package:opshr/general/allExports.dart';
import 'package:flutter/cupertino.dart';
import 'package:opshr/pages/otherPages/teams/addTeams.dart';
import 'package:opshr/pages/otherPages/teams/teamProfile.dart';

Function refreshTeamsPage;

class ManageTeams extends StatefulWidget {
  const ManageTeams({Key key}) : super(key: key);

  @override
  State<ManageTeams> createState() => _ManageTeamsState();
}

class _ManageTeamsState extends State<ManageTeams> {
  @override
  Widget build(BuildContext context) {

    refreshTeamsPage = () {
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
                        text: 'Manage Teams',
                        size: 24,
                        color: AppColors().black,
                        bold: true,
                      ),

                      SizedBox(height: 20),




                      //  Align(
                     //     alignment: Alignment.centerRight,
                     //     child: CommonTextButton(text: 'Add Teams',
                        //    onTapped: () {
                        //      Navigator.push(
                         //         context,
                         //         MaterialPageRoute(
                         //             builder: (context) => AddTeam(refreshTeamsPage: refreshTeamsPage,)));
                        //    },
                        //  )
                    //  ),

                      SizedBox(height: 20),

                      //data form

                      Container(
                        constraints: BoxConstraints(maxWidth: 700),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [


                              Column(
                                  children: allTeams.map((team) {
                                    return TeamWidget(teamData: team);
                                  }).toList()),


                            ]),
                      )
                    ],
                  ))));
  }
}


class TeamWidget extends StatelessWidget {

  final Team teamData;

  const TeamWidget({Key key, this.teamData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(

        onTap: () {

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TeamProfile(teamData: teamData)));


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
        //  width: MediaQuery.of(context).size.width - 24,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


              Container(
               // width: MediaQuery.of(context).size.width - 70, //this way i am leaving a width of 50px for the forward icon
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    CommonTextWithMaxLines(
                      text: teamData.name.toUpperCase(),
                      size: 20,
                      color: AppColors().black,
                      maxLines: 1,
                    ),

                    SizedBox(height: 12.5,),

                    CommonText(
                      text: teamData.description,
                      size: 18,
                      color: AppColors().black,
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
