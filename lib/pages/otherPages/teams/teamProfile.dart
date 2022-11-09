import 'package:flutter/material.dart';
import 'package:opshr/pages/otherPages/teams/addTeams.dart';
import 'package:opshr/pages/otherPages/teams/manageTeams.dart';

import '../../../apiRequests/requests.dart';
import '../../../general/colors.dart';
import '../../../general/functions.dart';
import '../../../general/widgets.dart';
import '../../../models/team/team.dart';
import 'editTeam.dart';

class TeamProfile extends StatefulWidget {

  final Team teamData;

  const TeamProfile({Key key, @required this.teamData}) : super(key: key);

  @override
  State<TeamProfile> createState() => _TeamProfileState();
}

class _TeamProfileState extends State<TeamProfile> {
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
                      text: 'Teams Data',
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
                                text: 'Teams ID: ',
                                bold: true,
                                color: AppColors().darkGrey,
                                size: 16,
                              ),

                              CommonText(
                                text: widget.teamData.teamId,
                                color: Colors.black,
                                size: 18,
                              ),

                            ]),

                            SizedBox(height: 5),

                            TheHubRichText(commonTexts: [

                              CommonText(
                                text: 'Team Name: ',
                                bold: true,
                                color: AppColors().darkGrey,
                                size: 16,
                              ),

                              CommonText(
                                text: widget.teamData.name,
                                color: Colors.black,
                                size: 18,
                              ),

                            ]),

                            SizedBox(height: 5),

                            TheHubRichText(commonTexts: [

                              CommonText(
                                text: 'Team Description: ',
                                bold: true,
                                color: AppColors().darkGrey,
                                size: 16,
                              ),

                              CommonText(
                                text: widget.teamData.description,
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
                                            builder: (context) =>EditTeam(refreshTeamsPage: refreshTeamsPage, pastTeamData: widget.teamData,)));





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
                                        text: 'EDIT TEAM',
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
                                                  'Are you sure you want to delete this Team?',
                                                ),

                                                SizedBox(
                                                    height: 20), //common space

                                                Align(
                                                    alignment: Alignment.center,
                                                    child: GestureDetector(
                                                      onTap: () async{
                                                        await ApiRequests().deleteTeam(widget.teamData.teamId);
                                                        allTeams.remove(widget.teamData);

                                                        refreshTeamsPage();

                                                        showSnackLong(
                                                            context,
                                                            'Team Deleted',
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
                                        text: 'DELETE TEAM',
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
