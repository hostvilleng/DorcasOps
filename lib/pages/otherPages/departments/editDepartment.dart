import 'package:flutter/material.dart';

import '../../../apiRequests/requests.dart';
import '../../../general/colors.dart';
import '../../../general/functions.dart';
import '../../../general/widgets.dart';
import '../../../jsonToModels/department.dart';
import '../../../models/department/department.dart';
import '../../navPages/departments.dart';



TextEditingController _departmentNameController = TextEditingController();
TextEditingController _departmentDescriptionController = TextEditingController();

class EditDepartment extends StatefulWidget {

  final Function refreshDepartmentsPage;
  final Department pastDepartmentData;
  const EditDepartment({Key key, @required this.refreshDepartmentsPage, @required this.pastDepartmentData}) : super(key: key);

  @override
  State<EditDepartment> createState() => _EditDepartmentState();
}

class _EditDepartmentState extends State<EditDepartment> {

  void initState() {
    // TODO: implement initState
    super.initState();

    _departmentNameController.text = widget.pastDepartmentData.name;
    _departmentDescriptionController.text = widget.pastDepartmentData.description;

  }

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
                      text: 'Edit Department',
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
                            CommonText(
                              text: 'Department Name:',
                              size: 17,
                            ),
                            SizedBox(height: 12),
                            CommonTextFieldSmall(
                              controller: _departmentNameController,
                              hintText: '',
                            ),

                            SizedBox(
                              height: 20,
                            ), //common space

                            CommonText(
                              text: 'Description:',
                              size: 17,
                            ),
                            SizedBox(height: 12),
                            CommonTextFieldSmall(
                              controller: _departmentDescriptionController,
                              hintText: '',
                              enabled: false,
                            ),


                            SizedBox(
                              height: 20,
                            ), //common space

                            //add button

                            Align(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () async {

                                    await ApiRequests().deleteDepartment(widget.pastDepartmentData.departmentId);
                                    allDepartments.remove(widget.pastDepartmentData);



                                    dynamic departmentJsonData =
                                    await ApiRequests().updateDepartment(Department(
                                      name: _departmentNameController.text,
                                      description:
                                      _departmentDescriptionController.text,
                                      addedOn: null,

                                    ));


                                    allDepartments.add(
                                        mainDepartmentJsonDataToDepartmentModel(departmentJsonData));



                                    widget.refreshDepartmentsPage();

                                    _departmentNameController.clear();
                                    _departmentDescriptionController.clear();



                                  //  Navigator.pop(context);

                                    showSnackLong(context,
                                        'Department Edited Successfully', false);
                                  },
                                  child: CommonTextButtonBig(
                                      text: 'Save Department', textSize: 17),
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
