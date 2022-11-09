import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../general/allExports.dart';

enum AccountPriority{
  high,
  medium,
  low
}

List<String> projectStatusList =[
  'completed',
  'in-progress',
  'overdue',
  'backlog'
];

class TaskUpdate extends StatefulWidget {
  final String id;
  const TaskUpdate({Key key,this.id}) : super(key: key);

  @override
  State<TaskUpdate> createState() => _TaskUpdateState();
}

class _TaskUpdateState extends State<TaskUpdate> {
  TextEditingController _taskNameController = TextEditingController();
  TextEditingController _taskDescriptionController = TextEditingController();

  GlobalKey<FormState> fromKey = GlobalKey<FormState>();

  AccountPriority priorityType;
  String projectStatus;
  var editRequest;

  @override
  void initState() {
    editRequest = ApiRequests().editTasks(widget.id);
    super.initState();
  }

  @override
  void dispose() {
    _taskNameController.dispose();
    _taskDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
            child: Form(
              key: fromKey,
              child: FutureBuilder(
                future: editRequest,
                builder:(context, snapshot) {
                  //wait for data to come
                  if(snapshot.data == null || snapshot.connectionState == ConnectionState.waiting){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final data = snapshot.data;

                  if(data is bool && data == false){
                    return Center(child: Text("Error"));
                  }

                  _taskNameController.value= TextEditingValue(text: data['data']['name'] ?? '');
                  _taskDescriptionController.value= TextEditingValue(text: data['data']['description'] ?? '');

                  return SingleChildScrollView(
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
                          Text("Edit Task", style: GoogleFonts.inter(
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

                                  TextFormField(
                                    validator: (value) {
                                      if (_taskNameController.text.isEmpty) {
                                        return "This field can't be empty";
                                      }else{
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      //hintText: "Short Description:",
                                      labelText: 'Task Name:',
                                      labelStyle: TextStyle(fontSize: 12,color: Colors.blueAccent),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(13)
                                      ),
                                    ),

                                    // minLines: null,
                                    //maxLines: null,
                                    // If this is null, there is no limit to the number of lines, and the text container will start with enough vertical space for one line and automatically grow to accommodate additional lines as they are entered.
                                    //expands:
                                    //true, // If
                                    controller: _taskNameController,
                                  ),

                                  SizedBox(
                                    height: 20,
                                  ),

                                  TextFormField(
                                    validator: (value) {
                                      if (_taskDescriptionController.text.isEmpty) {
                                        return "This field can't be empty";
                                      }else{
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      //hintText: "Short Description:",
                                      labelText: 'Description::',
                                      labelStyle: TextStyle(fontSize: 12,color: Colors.blueAccent),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(13)
                                      ),
                                    ),

                                    // minLines: null,
                                    //maxLines: null,
                                    // If this is null, there is no limit to the number of lines, and the text container will start with enough vertical space for one line and automatically grow to accommodate additional lines as they are entered.
                                    //expands:
                                    //true, // If
                                    controller: _taskDescriptionController,
                                  ),

                                  SizedBox(
                                    height: 20,
                                  ),

                                  //priority
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: DropdownButton(
                                          items: AccountPriority.values.map((value) => DropdownMenuItem(
                                            child: Text(
                                              value.name,
                                              style: TextStyle(color: Colors.blueAccent,
                                                fontSize: 12,),
                                            ),
                                            value: value,
                                          )).toList(),

                                          onChanged: (selectedAccountType) {
                                            print('$selectedAccountType');
                                            setState(() {
                                              priorityType = selectedAccountType;
                                            });
                                          },
                                          value: priorityType,
                                          isExpanded: false,
                                          hint: Text(
                                            'Choose priority ',
                                            style: TextStyle(color: Colors.blueAccent),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(
                                    height: 20,
                                  ),

                                  //project status
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: DropdownButton(
                                          items: projectStatusList.map((value) => DropdownMenuItem(
                                            child: Text(
                                              value,
                                              style: TextStyle(color: Colors.blueAccent,
                                                fontSize: 12,),
                                            ),
                                            value: value,
                                          )).toList(),

                                          onChanged: (selectedAccountType) {
                                            print('$selectedAccountType');
                                            setState(() {
                                              projectStatus = selectedAccountType;
                                            });
                                          },
                                          value: projectStatus,
                                          isExpanded: false,
                                          hint: Text(
                                            'Choose Project Status',
                                            style: TextStyle(color: Colors.blueAccent),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),


                                  SizedBox(
                                    height: 20,
                                  ),

                                  //add button
                                  Align(
                                      alignment: Alignment.bottomCenter,
                                      child: GestureDetector(
                                        onTap: () async {
                                          if(fromKey.currentState.validate()){
                                            log(widget.id);
                                            log(_taskNameController.text);
                                            log(_taskDescriptionController.text);
                                            log(priorityType.name);
                                            log(projectStatus);

                                            dynamic taskJsonData = await ApiRequests().updateTask(
                                              id: widget.id,
                                              task: _taskNameController.text,
                                              task_description: _taskDescriptionController.text,
                                              priority: priorityType.name,
                                              projectStatus:projectStatus,

                                            );

                                            if(taskJsonData == false){
                                              showSnackLong(context, 'Error', true);
                                            }else{
                                              _taskNameController.clear();
                                              _taskDescriptionController.clear();
                                              showSnackLong(context, 'Task Updated Successfully', false);
                                            }


                                            // allTasks.add(
                                            //    mainTaskJsonDataToTaskModel(
                                            //       taskJsonData));

                                            // widget.refreshTeamsPage();
                                            // Navigator.pop(context);
                                          }

                                        },
                                        child:Container(
                                          decoration: BoxDecoration(
                                              color: AppColors().mainColor,
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(20))),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 140, vertical: 20),
                                            child: CommonText(
                                              text: 'Save Task',
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
                      )
                  );
                },
              ),
            )));
  }
}
