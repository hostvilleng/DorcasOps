import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../general/allExports.dart';

enum AccountPriority{
  high,
  medium,
  low
}
/*List<String> _accountType = [
  'High',
  'Medium ',
  'Low',
];*/
class TaskAdd extends StatefulWidget {
  final Function refreshTaskPage;
  const TaskAdd({Key key,@required this.refreshTaskPage}) : super(key: key);

  @override
  State<TaskAdd> createState() => _TaskAddState();
}

class _TaskAddState extends State<TaskAdd> {
  TextEditingController _taskNameController = TextEditingController();
  TextEditingController _taskDescriptionController = TextEditingController();
  TextEditingController _start_dateController = TextEditingController();
  TextEditingController _end_dateController = TextEditingController();

  GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  DateTime startDueDate = DateTime.now();
  DateTime endDueDate = DateTime.now();
  //bool _invoiceReminderValue = false;

  var selectedCurrency;
  AccountPriority selectedType;

  @override
  void dispose() {
    _taskNameController.dispose();
    _taskDescriptionController.dispose();
    _start_dateController.dispose();
    _end_dateController.dispose();
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
                      Text("Add New Task", style: GoogleFonts.inter(
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
                                          selectedType = selectedAccountType;
                                        });
                                      },
                                      value: selectedType,
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

                              GestureDetector(
                                onTap: () {

                                  setState(() {
                                    _start_dateController.text =
                                        DateFormat('yyyy-MM-ddThh:mm:ss')
                                            .format(startDueDate);
                                  });
                                  // Show the modal that contains the CupertinoDatePicker

                                  showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30.0),
                                          topRight: Radius.circular(30.0),
                                        ),
                                      ),
                                      context: context,
                                      builder: (BuildContext context) {
                                        return StatefulBuilder(builder: (BuildContext
                                        context,
                                            StateSetter
                                            setState /*You can rename this!*/) {
                                          return CommonBottomSheetMobile(
                                            heightPercentage: 0.8,
                                            widgets: [
                                              SizedBox(height: 15), //common space

                                              CommonText(
                                                text: 'Start Date:',
                                                size: 17,
                                              ),

                                              SizedBox(height: 17), //common space

                                              Container(
                                                height: 300,
                                                child: CupertinoDatePicker(
                                                    mode:
                                                    CupertinoDatePickerMode.date,
                                                    initialDateTime: startDueDate,
                                                    onDateTimeChanged: (val) {
                                                      startDueDate = val;

                                                      _start_dateController.text =
                                                          DateFormat('yyyy-MM-ddThh:mm:ss')
                                                              .format(startDueDate);

                                                      setState(() {});
                                                    }),
                                              ),

                                              // Close the modal
                                              Center(
                                                child: CupertinoButton(
                                                  child: CommonText(
                                                    text: 'OK',
                                                  ),
                                                  onPressed: () =>
                                                      Navigator.of(context).pop(),
                                                ),
                                              )
                                            ],
                                            topWidgets: [
                                              Center(
                                                  child:
                                                 roundedModalSheetTopSitter()),

                                              SizedBox(height: 17), //common space

                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Container(),
                                                  CancelBottomSheetButton(
                                                    onTapped: () =>
                                                        Navigator.pop(context),
                                                  ),
                                                ],
                                              ),
                                            ],
                                            refreshMe: () => setState(() {}),
                                          );
                                        });
                                      });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8.0, left: 8,bottom: 10),
                                      child: Container(
                                        height: 40,

                                        child:
                                        TextFormField(
                                          enabled: false,
                                          //keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            //hintText: "Short Description:",
                                            labelText: 'Start Date...',
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
                                          controller: _start_dateController,
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),

                              SizedBox(
                                height: 10,
                              ),

                              GestureDetector(
                                onTap: () {

                                  setState(() {
                                    _end_dateController.text =
                                        DateFormat('yyyy-MM-ddThh:mm:ss')
                                            .format(endDueDate);
                                  });
                                  // Show the modal that contains the CupertinoDatePicker

                                  showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30.0),
                                          topRight: Radius.circular(30.0),
                                        ),
                                      ),
                                      context: context,
                                      builder: (BuildContext context) {
                                        return StatefulBuilder(builder: (BuildContext
                                        context,
                                            StateSetter
                                            setState /*You can rename this!*/) {
                                          return CommonBottomSheetMobile(
                                            heightPercentage: 0.8,
                                            widgets: [
                                              SizedBox(height: 15), //common space

                                              CommonText(
                                                text: 'End Date:',
                                                size: 17,
                                              ),

                                              SizedBox(height: 17), //common space

                                              Container(
                                                height: 300,
                                                child: CupertinoDatePicker(
                                                    mode:
                                                    CupertinoDatePickerMode.date,
                                                    initialDateTime: endDueDate,
                                                    onDateTimeChanged: (val) {
                                                      endDueDate = val;

                                                      _end_dateController.text =
                                                          DateFormat('yyyy-MM-ddThh:mm:ss')
                                                              .format(endDueDate);

                                                      setState(() {});
                                                    }),
                                              ),

                                              // Close the modal
                                              Center(
                                                child: CupertinoButton(
                                                  child: CommonText(
                                                    text: 'OK',
                                                  ),
                                                  onPressed: () =>
                                                      Navigator.of(context).pop(),
                                                ),
                                              )
                                            ],
                                            topWidgets: [
                                              Center(
                                                  child:
                                                  roundedModalSheetTopSitter()),

                                              SizedBox(height: 17), //common space

                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Container(),
                                                  CancelBottomSheetButton(
                                                    onTapped: () =>
                                                        Navigator.pop(context),
                                                  ),
                                                ],
                                              ),
                                            ],
                                            refreshMe: () => setState(() {}),
                                          );
                                        });
                                      });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8.0, left: 8,bottom: 10),
                                      child: Container(
                                        height: 40,

                                        child:
                                        TextFormField(
                                          enabled: false,
                                          //keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            //hintText: "Short Description:",
                                            labelText: 'End Date...',
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
                                          controller: _end_dateController,
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),



                              SizedBox(
                                height: 20,
                              ), //common space

                              //add button

                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: GestureDetector(
                                    onTap: () async {
                                      if(fromKey.currentState.validate()){
                                        log(_taskNameController.text);
                                        log(_taskDescriptionController.text);
                                        log(selectedType.name);
                                        log(_start_dateController.text);
                                        log(_end_dateController.text);

                                        dynamic taskJsonData = await ApiRequests().createTask(
                                            task: _taskNameController.text,
                                            task_description: _taskDescriptionController.text,
                                            priority: selectedType.name,
                                            start_date:_start_dateController.text,
                                            end_date:_end_dateController.text
                                        );

                                        if(taskJsonData == false){
                                          showSnackLong(context, 'Error', true);
                                        }else{
                                          _taskNameController.clear();
                                          _taskDescriptionController.clear();
                                          showSnackLong(context, 'Task Successfully Added', false);
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
                  )),
            )));
  }
}
