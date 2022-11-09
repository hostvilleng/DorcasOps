import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../apiRequests/requests.dart';
import '../../../../general/functions.dart';
import '../../../../general/widgets.dart';




TextEditingController _groupNameController = TextEditingController();

class CreatePaygroup extends StatefulWidget {

  final Function refreshPaygroupsPage;

  const CreatePaygroup({Key key,  this.refreshPaygroupsPage}) : super(key: key);

  @override
  State<CreatePaygroup> createState() => _CreatePaygroupState();
}

class _CreatePaygroupState extends State<CreatePaygroup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 60, 10, 0),
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 24,
                                color: Colors.black,
                              )),
                          SizedBox(
                            width: 110,
                          ),
                          Text("Add PayGroups", style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,

                          ),),
                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      //common space



                      SizedBox(height: 20),

                      Container(
                          constraints: BoxConstraints(maxWidth: 700),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              TextFormField(
                                validator: (value) {
                                  if (_groupNameController.text.isEmpty) {
                                    return "This field can't be empty";
                                  }else{
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  //hintText: "Short Description:",
                                  labelText: 'Name:',
                                  labelStyle: TextStyle(fontSize: 12,color: Colors.black),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(13)
                                  ),
                                ),

                                // minLines: null,
                                //maxLines: null,
                                // If this is null, there is no limit to the number of lines, and the text container will start with enough vertical space for one line and automatically grow to accommodate additional lines as they are entered.
                                //expands:
                                //true, // If
                                controller: _groupNameController,
                              ),

                              //data form



                              SizedBox(
                                height: 10,
                              ),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: GestureDetector(
                                    onTap: () async {
                                       dynamic paygroupJsonData = await ApiRequests().createPaygroup(
                                         group_name: _groupNameController.text,

                                       );

                                       if(paygroupJsonData == false){
                                      showSnackLong(context, 'Error', true);
                                       }else{
                                        _groupNameController.clear();

                                      showSnackLong(context, 'Task Successfully Added', false);
                                      }


                                       //allPaygroups.add(
                                        //  mainTaskJsonDataToTaskModel(
                                       //      taskJsonData));

                                      // widget.refreshTeamsPage();
                                      // Navigator.pop(context);
                                      // }

                                    },
                                    child:Container(
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(20))),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 120, vertical: 18),
                                        child: CommonText(
                                          text: 'Submit',
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),

                                  )),


                              //add button

                              SizedBox(
                                height: 20,
                              )
                            ],
                          ))]))));
  }
}
