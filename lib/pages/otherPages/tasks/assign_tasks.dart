import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../general/allExports.dart';

class AssignTasks extends StatefulWidget {
  final String taskId;

  AssignTasks({Key key, @required this.taskId}) : super(key: key);

  @override
  State<AssignTasks> createState() => _AssignTasksState();
}

class _AssignTasksState extends State<AssignTasks> {
  TextEditingController _employeeEmail = TextEditingController();

  GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  var editRequest;

  @override
  void initState() {
    editRequest = ApiRequests().editTasks(widget.taskId);
    super.initState();
  }

  @override
  void dispose() {
    _employeeEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
            child: Form(
              key: fromKey,
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
                      Text("Assign Task", style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,

                      ),),

                      SizedBox(
                        height: 20,
                      ),
                      
                      FutureBuilder(
                          future: editRequest,
                          builder: (context, snapshot) {
                            //wait for data to come
                            if (snapshot.data == null || snapshot.connectionState == ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            final data = snapshot.data;

                            if (data is bool && data == false) {
                              return Center(child: Text("Error"));
                            }

                            return Card(
                              child: ListTile(
                                title: Text(data['data']['name'], style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,

                                ),),
                                subtitle: Text(data['data']['description'], style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,

                                ),),
                              ),
                            );
                          }),


                      SizedBox(height: 20),

                      //data form

                      Container(
                        constraints: BoxConstraints(maxWidth: 700),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              TextFormField(
                                validator: (value) {
                                  if (_employeeEmail.text.isEmpty) {
                                    return "This field can't be empty";
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  //hintText: "Short Description:",
                                  labelText: 'Employee Email:',
                                  labelStyle: TextStyle(fontSize: 12,
                                      color: Colors.blueAccent),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(13)
                                  ),
                                ),

                                // minLines: null,
                                //maxLines: null,
                                // If this is null, there is no limit to the number of lines, and the text container will start with enough vertical space for one line and automatically grow to accommodate additional lines as they are entered.
                                //expands:
                                //true, // If
                                controller: _employeeEmail,
                              ),


                              SizedBox(
                                height: 10,
                              ),

                              //assign button
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: GestureDetector(
                                    onTap: () async {
                                      if (fromKey.currentState.validate()) {
                                        log(_employeeEmail.text);

                                        dynamic taskJsonData = await ApiRequests()
                                            .assignTask(
                                            employeeEmail: _employeeEmail.text,
                                            taskId: widget.taskId
                                        );

                                        if (taskJsonData == false) {
                                          showSnackLong(context, 'Error', true);
                                        } else {
                                          _employeeEmail.clear();
                                          showSnackLong(context,
                                              'Task Assigned Successfully',
                                              false);
                                        }
                                      }
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width*0.4,
                                      height: MediaQuery.of(context).size.height*0.07,
                                      decoration: BoxDecoration(
                                          color: AppColors().mainColor,
                                          borderRadius:
                                          BorderRadius.all(
                                              Radius.circular(20))),
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: CommonText(
                                          text: 'Assign Task',
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),

                                  )),

                              SizedBox(
                                height: 20,
                              ),
                            ]),
                      )
                    ],
                  )),
            )));
  }
}
