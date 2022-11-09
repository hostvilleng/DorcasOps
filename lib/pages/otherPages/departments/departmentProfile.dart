import 'package:opshr/general/allExports.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:opshr/pages/otherPages/departments/editDepartment.dart';

TextEditingController _userNoteController = TextEditingController();

class DepartmentProfile extends StatefulWidget {
  
  final Department departmentData;
  const DepartmentProfile({Key key, @required this.departmentData}) : super(key: key);
 
  @override
  _DepartmentProfileState createState() => _DepartmentProfileState();
}

class _DepartmentProfileState extends State<DepartmentProfile> {
  get refreshDepartmentsPage => null;

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
                  text: 'Department data',
                  size: 24,
                  color: AppColors().black,
                  bold: true,
                ),
                CommonText(
                  text:
                      'All data about ${widget.departmentData.name}',
                  size: 20,
                  color: AppColors().grey,
                ),

                SizedBox(height: 20),

                //data form

                Container(
                  constraints: BoxConstraints(maxWidth: 700),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //department data
                        CommonText(
                          text: 'Data:',
                          bold: true,
                          color: AppColors().darkGrey,
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        TheHubRichText(commonTexts: [
                          CommonText(
                            text: 'Name: ',
                            bold: true,
                            color: AppColors().darkGrey,
                          ),
                          CommonText(
                            text: widget.departmentData.name,
                            color: AppColors().black,
                          ),
                        ]),


                        SizedBox(
                          height: 10,
                        ),


                        TheHubRichText(commonTexts: [
                          CommonText(
                            text: 'Description: ',
                            bold: true,
                            color: AppColors().darkGrey,
                          ),
                          CommonText(
                            text: widget.departmentData.description,
                            color: AppColors().black,
                          ),
                        ]),


                        SizedBox(
                          height: 10,
                        ),
                        
                        TheHubRichText(commonTexts: [
                          CommonText(
                            text: 'Date Added: ',
                            bold: true,
                            color: AppColors().darkGrey,
                          ),
                          CommonText(
                            text: '${DateFormat('MMM, d, y').format(widget.departmentData.addedOn)}',
                            color: AppColors().black,
                          ),
                        ]),

                        
                        SizedBox(
                          height: 20,
                        ),

                        Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>EditDepartment(refreshDepartmentsPage: refreshDepartmentsPage, pastDepartmentData: widget.departmentData,)));
                                

                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppColors().mainColor,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(7))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 10),
                                  child: CommonText(
                                    text: 'EDIT DEPARTMENT',
                                    size: 14,
                                    color: Colors.white,
                                    alignTextCenter: true,
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(height: 20),

                        Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {

                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: AppColors().white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30.0),
                                        topRight: Radius.circular(30.0),
                                      ),
                                    ),
                                    context: context,
                                    builder: (BuildContext context) {
                                      return StatefulBuilder(builder:
                                          (BuildContext context,
                                          StateSetter setState) {
                                        return CommonBottomSheetMobile(
                                          heightPercentage: 0.45,
                                          refreshMe: () => setState(() {}),
                                          topWidgets: [
                                            Center(
                                                child:
                                                roundedModalSheetTopSitter()),
                                          ],
                                          widgets: [
                                            SizedBox(
                                                height: 17), //common space

                                            CommonText(
                                              text: 'WARNING:',
                                              size: 17,
                                              color: Colors.grey,
                                              bold: true,
                                            ),

                                            SizedBox(
                                                height: 20), //common space

                                            CommonText(
                                              text:
                                              'Are you sure you want to delete this Department?',
                                            ),

                                            SizedBox(
                                                height: 20), //common space

                                            Align(
                                                alignment: Alignment.center,
                                                child: GestureDetector(
                                                  onTap: () async{
                                                    await ApiRequests().deleteDepartment(widget.departmentData.departmentId);
                                                    allDepartments.remove(widget.departmentData);

                                                    refreshDepartmentPage();

                                                    showSnackLong(
                                                        context,
                                                        'Team Deleted',
                                                        true);

                                                    Navigator.pop(context);

                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color:
                                                        AppColors().red,
                                                        borderRadius:
                                                        BorderRadius.all(
                                                            Radius
                                                                .circular(
                                                                7))),
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 40,
                                                          vertical: 10),
                                                      child: CommonText(
                                                        text: 'DELETE',
                                                        size: 14,
                                                        color: Colors.white,
                                                        alignTextCenter: true,
                                                      ),
                                                    ),
                                                  ),
                                                )),

                                            SizedBox(height: 10),

                                            Align(
                                                alignment: Alignment.center,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: AppColors()
                                                            .mainColor,
                                                        borderRadius:
                                                        BorderRadius.all(
                                                            Radius
                                                                .circular(
                                                                7))),
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 40,
                                                          vertical: 10),
                                                      child: CommonText(
                                                        text: 'CANCEL',
                                                        size: 14,
                                                        color: Colors.white,
                                                        alignTextCenter: true,
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                          ],
                                        );
                                      });
                                    });

                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppColors().red,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(7))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 10),
                                  child: CommonText(
                                    text: 'DELETE DEPARTMENT',
                                    size: 14,
                                    color: Colors.white,
                                    alignTextCenter: true,
                                  ),
                                ),
                              ),
                            )),

                        //department notes


                      ]),
                )
              ],
            ))));
  }
}
