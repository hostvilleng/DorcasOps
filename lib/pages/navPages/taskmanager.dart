import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:opshr/pages/otherPages/tasks/controller/tab_controller.dart';
import 'package:opshr/pages/otherPages/tasks/manageTasks.dart';
import 'package:opshr/pages/otherPages/tasks/removeTask.dart';
import 'package:opshr/pages/otherPages/tasks/task_add_page.dart';
import 'package:opshr/pages/otherPages/tasks/viewAllEmployeeAssignedToTasks.dart';
import '../../otherWidgets.dart/color_constant.dart';
import '../../otherWidgets.dart/widgets.dart';
import '../otherPages/tasks/all_tasks.dart';
import '../otherPages/tasks/assign_tasks.dart';
import '../otherPages/tasks/task_edit_page.dart';
import '../otherPages/tasks/task_update_page.dart';


class TaskManager extends StatefulWidget {
  const TaskManager({Key key}) : super(key: key);

  @override
  State<TaskManager> createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager> {
  int _tabIndex = 0;
  final taskTabController = Get.put(TaskTabController());

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                left: 16,
                right: 16,
                top: 16,
                bottom: 0,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(Icons.arrow_back_ios),
                            )),
                        const Expanded(
                            child: Center(
                                child: Text(
                                  "Task Manager",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ))),
                        Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Stack(
                                children: const [

                                Icon(
                                  Icons.notifications_outlined),
                                  Positioned(
                                      right: 0,
                                      top: 0,
                                      child: CircleAvatar(
                                        radius: 4,
                                        backgroundColor: Colors.red,
                                      ))
                                ],
                              ),
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              //Text(
                               // "Welcome Back!",
                               // style: TextStyle(fontSize: 15),
                             // ),
                              SizedBox(
                                height: 8,
                              ),
                              //Text(
                               // "Here's Update Today.",
                               // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                            //  ),
                            ],
                          ),
                          const Spacer(),
                         // const CircleAvatar(
                          //  backgroundColor: Colors.black,
                          //  foregroundColor: Colors.white,
                           // child:
                          //  Icon(
                             //   Icons.search),
                        //  )
                        ],
                      ),
                    ),

                    SizedBox(height: 20),


                    BasicItemWidget(icon: Ionicons.person_add_outline, title: 'Add New Task', onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TaskAdd()));
                    },),
                    //MyDivider(),
                    //BasicItemWidget(icon: Ionicons.people_outline, title: 'Manage Task', onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => ManageTask ()));
                   // },),

                    MyDivider(),
                    BasicItemWidget(icon: Ionicons.people_outline, title: 'Manage Task', onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AllTasks ()));
                    },),

                    MyDivider(),
                    BasicItemWidget(icon: Ionicons.people_outline, title: 'Assign Task to Employee', onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AssignTasks (taskId:'fc4adfca-57bd-11ed-8690-06cd347bfd45')));
                    },),

                    MyDivider(),
                    BasicItemWidget(icon: Ionicons.people_outline, title: 'Remove Employee From Task', onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => RemoveTask ()));
                     },),

                    MyDivider(),
                    BasicItemWidget(icon: Ionicons.people_outline, title: 'View Task and Employee Assigned', onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ViewTaskandAllEmployeeAssignedtothetask ()));
                    },),

                    MyDivider(),

                    SizedBox(
                      height: 36,

                    ),

                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.white.withOpacity(0.7),
                        Colors.white.withOpacity(0.75),
                        Colors.white.withOpacity(0.5),
                        Colors.white.withOpacity(0.25),
                        Colors.white.withOpacity(0.1),
                      ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
                  // child: Center(
                  //   child: Container(
                  //
                  //     decoration: BoxDecoration(
                  //       color: Colors.black,
                  //       borderRadius: BorderRadius.circular(24)
                  //     ),
                  //     child: Row(
                  //       children: [
                  //         Icon(Icons.add_box,),
                  //         Text("")
                  //
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ),
              )
            ],
          ),
        ),
        //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        //floatingActionButton: FloatingActionButton.extended(
        //  foregroundColor: Colors.white,
         // backgroundColor: Colors.black,
         // onPressed: () {
         //   Navigator.push(context,
          //      MaterialPageRoute(builder: (context) => TaskUpdate(id: 'fc4adfca-57bd-11ed-8690-06cd347bfd45',)));
         // },
         // label: const Text("Update Task"),
         // icon: const Icon(Icons.add_box),
     //   ),

      );
  }
}

