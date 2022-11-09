import 'package:flutter/material.dart';
import 'package:opshr/general/allExports.dart';
import 'package:opshr/jsonToModels/team.dart';
import 'package:flutter/cupertino.dart';
import 'addTeams.dart';



TextEditingController _teamNameController = TextEditingController();
TextEditingController _teamDescriptionController = TextEditingController();

class EditTeam extends StatefulWidget {

  final Function refreshTeamsPage;
  final Team pastTeamData;

  const EditTeam({Key key, @required this.refreshTeamsPage, @required this.pastTeamData}) : super(key: key, );

  @override
  State<EditTeam> createState() => _EditTeamState();
}

class _EditTeamState extends State<EditTeam> {

  void initState() {
    // TODO: implement initState
    super.initState();

    //filling in the old details

    _teamNameController.text = widget.pastTeamData.name;
    _teamDescriptionController.text = widget.pastTeamData.description;
  }

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
                      text: 'Edit Team',
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
                            CommonText(
                              text: 'Team Name:',
                              size: 17,
                            ),
                            SizedBox(height: 12),
                            CommonTextFieldSmall(
                              controller: _teamNameController,
                              hintText: '',
                            ),

                            SizedBox(
                              height: 20,
                            ), //common space


                            CommonText(
                              text: 'Team Description:',
                              size: 17,
                            ),
                            SizedBox(height: 12),
                            CommonTextFieldSmall(
                              controller: _teamDescriptionController,
                              hintText: '',
                            ),

                            SizedBox(
                              height: 20,
                            ), //common space

                            //add button

                            Align(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () async {

                                    await ApiRequests().deleteTeam(widget.pastTeamData.teamId);
                                    allTeams.remove(widget.pastTeamData);



                                    dynamic teamJsonData =
                                    await ApiRequests().updateTeam(Team(
                                      name: _teamNameController.text,
                                      description:
                                      _teamDescriptionController.text,
                                      addedOn: null,

                                    ));

                                    allTeams.add(
                                        mainTeamJsonDataToTeamModel(
                                            teamJsonData));

                                    widget.refreshTeamsPage();

                                    _teamNameController.clear();
                                    _teamDescriptionController.clear();


                                   // Navigator.pop(context);

                                    showSnackLong(context,
                                        'Team Edited Successfully', false);
                                  },
                                  child: CommonTextButtonBig(
                                      text: 'Save Teams', textSize: 17),
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
