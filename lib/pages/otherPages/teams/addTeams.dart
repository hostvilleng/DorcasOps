import 'package:google_fonts/google_fonts.dart';
import 'package:opshr/general/allExports.dart';
import 'package:opshr/jsonToModels/team.dart';

import '../../../otherWidgets.dart/color_constant.dart';

List<Team> allTeams = [

  //  Product(productId: 'CSDC2523', name: 'CocaCola Coke', description: 'A 50cl plastic bottle at wholesale price', currency: 'NGN', unitPrice: 75, stockAmount: 4640, addedOn: DateTime.now(),),
  //  Product(productId: 'ASWE7432', name: 'CocaCola Fanta', description: 'A 75cl plastic bottle at wholesale price', currency: 'NGN', unitPrice: 120, stockAmount: 800, addedOn: DateTime.now(),),


];
TextEditingController _teamNameController = TextEditingController();
TextEditingController _teamDescriptionController = TextEditingController();

class AddTeam extends StatefulWidget {
  final Function refreshTeamsPage;
  const AddTeam({Key key, @required this.refreshTeamsPage}) : super(key: key);

  @override
  State<AddTeam> createState() => _AddTeamState();
}

class _AddTeamState extends State<AddTeam> {
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
                      ),
                      //common space
                      Text("Add New Team", style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,

                      ),),


                      SizedBox(height: 20),

                      //data form

                      Container(
                        constraints: BoxConstraints(maxWidth: 700),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Name", style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,

                              ),),
                              SizedBox(height: 12),
                              CommonTextFieldSmall(
                                controller: _teamNameController,
                                hintText: '',
                              ),

                              SizedBox(
                                height: 20,
                              ), //common space

                              Text("Description:", style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,

                              ),),
                              SizedBox(height: 12),
                              CommonTextFieldSmall(
                                controller: _teamDescriptionController,
                                hintText: '',
                                //enabled: false,
                              ),

                              SizedBox(
                                height: 20,
                              ), //common space


                              SizedBox(
                                height: 20,
                              ), //common space

                              //add button

                              Align(
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                    onTap: () async {
                                      dynamic teamJsonData =
                                      await ApiRequests().createTeam(Team(
                                        name: _teamNameController.text,
                                        description: _teamDescriptionController.text,
                                        addedOn: null,


                                      ));

                                      allTeams.add(
                                          mainTeamJsonDataToTeamModel(
                                              teamJsonData));

                                     // widget.refreshTeamsPage();

                                      _teamNameController.clear();
                                      _teamDescriptionController.clear();


                                     // Navigator.pop(context);

                                      showSnackLong(context,
                                          'Team Successfully Added', false);
                                    },
                                    child: CommonTextButtonBig(
                                        text: 'Save Team', textSize: 17),
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
