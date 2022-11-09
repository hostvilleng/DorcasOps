import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opshr/apiRequests/requests.dart';
import 'package:opshr/pages/otherPages/tasks/taskProfile.dart';
import 'package:opshr/pages/otherPages/tasks/task_update_page.dart';

import '../../../general/colors.dart';
import '../../../general/widgets.dart';
import '../../../models/task/task.dart';


Function refreshTaskPage;

class ManageTask extends StatefulWidget {
  const ManageTask({Key key}) : super(key: key);

  @override
  State<ManageTask> createState() => _ManageTaskState();
}

class _ManageTaskState extends State<ManageTask> {
  @override
  Widget build(BuildContext context) {
    refreshTaskPage = () {
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
                      text: 'Manage Task',
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

                            FutureBuilder(
                              future: ApiRequests().getAllTasks(),
                              builder: (context, snapshot) {
                                //waiting for data
                                if(snapshot.connectionState == ConnectionState.waiting){
                                  return Center(child: CircularProgressIndicator(),);
                                }

                                final data = snapshot.data;

                                //if there is an error
                                if(data is bool && data == false){
                                  return Center(child: Text("Error"));
                                }

                                //show all tasks
                                return Expanded(
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: data['data'].length,
                                    itemBuilder: (context, index) {
                                      return SizedBox(
                                        width: MediaQuery.of(context).size.width*0.92,
                                        height: MediaQuery.of(context).size.height*0.15,
                                        child: Card(
                                          child: ListTile(
                                            onTap: (){
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => TaskUpdate(id:data['data'][index]['id']),));
                                            },
                                            title: Text(data['data'][index]['name'], style: GoogleFonts.inter(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,

                                            ),),
                                            subtitle: Text(data['data'][index]['description'], style: GoogleFonts.inter(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54,

                                            ),),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            )


                          //  Column(
                              //  children: allTasks.map((task) {
                              //    return TaskWidget(taskData: task);
                               // }).toList()),



                          ]),
                    )
                  ],
                ))));
  }
}


class TaskWidget extends StatelessWidget {

  final Task taskData;

  const TaskWidget({Key key, this.taskData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(

        onTap: () {

          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TaskProfile(taskData: taskData)));


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
                      text: taskData.task.toUpperCase(),
                      size: 20,
                      color: AppColors().black,
                      maxLines: 1,
                    ),

                    SizedBox(height: 12.5,),

                    CommonText(
                      text: taskData.task_description,
                      size: 18,
                      color: AppColors().black,
                    ),

                    CommonText(
                      text: taskData.priority,
                      size: 18,
                      color: AppColors().black,
                    ),


                    CommonText(
                      text: taskData.start_date,
                      size: 18,
                      color: AppColors().black,
                    ),

                    CommonText(
                      text: taskData.end_date,
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

