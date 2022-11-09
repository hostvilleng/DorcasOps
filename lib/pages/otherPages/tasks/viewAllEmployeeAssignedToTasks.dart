import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opshr/pages/otherPages/tasks/task_update_page.dart';

import '../../../apiRequests/requests.dart';



class ViewTaskandAllEmployeeAssignedtothetask extends StatefulWidget {
  final String id;
  const ViewTaskandAllEmployeeAssignedtothetask({Key key, this.id}) : super(key: key);

  @override
  State<ViewTaskandAllEmployeeAssignedtothetask> createState() => _ViewTaskandAllEmployeeAssignedtothetaskState();

}

class _ViewTaskandAllEmployeeAssignedtothetaskState extends State<ViewTaskandAllEmployeeAssignedtothetask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
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

                  Text("Tasks Assigned to Employee", style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,

                  ),),


                  SizedBox(height: 20),

                  //data form

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
                                 //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => TaskUpdate(id:data['data'][index]['id']),));
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

                ],
              )),
        ));
  }
}