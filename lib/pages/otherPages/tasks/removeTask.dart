import 'package:google_fonts/google_fonts.dart';

import '../../../general/allExports.dart';

class RemoveTask extends StatefulWidget {
  final String taskId;

  const RemoveTask({Key key,@required this.taskId }) : super(key: key);

  @override
  State<RemoveTask> createState() => _RemoveTaskState();


}

class _RemoveTaskState extends State<RemoveTask> {

  GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  var editRequest;

  @override
  void initState() {
    editRequest = ApiRequests().editTasks(widget.taskId);
    super.initState();
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
                      Text("Remove Task", style: GoogleFonts.inter(
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
                              return Center(child: Text("loading"));
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



                              SizedBox(
                                height: 10,
                              ),

                              //assign button
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: GestureDetector(
                                    onTap: () async {
                                      if (fromKey.currentState.validate()) {
                                       // log(_employee.text);

                                        dynamic taskJsonData = await ApiRequests()
                                            .removeEmployeeFromTask(
                                            //employeeId: _employeeEmail.text,
                                            taskId: widget.taskId
                                        );

                                        if (taskJsonData == false) {
                                          showSnackLong(context, 'Error', true);
                                        } else {
                                          //_employeeId.clear();
                                          showSnackLong(context,
                                              'Task Successfully Removed from Employee',
                                              false);
                                        }
                                      }
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width*0.4,
                                      height: MediaQuery.of(context).size.height*0.07,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                          BorderRadius.all(
                                              Radius.circular(20))),
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: CommonText(
                                          text: 'Remove Task',
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
