import 'package:opshr/general/allExports.dart';
import 'package:flutter/cupertino.dart';

import '../../../jsonToModels/department.dart';



TextEditingController _departmentNameController = TextEditingController();
TextEditingController _departmentDescriptionController = TextEditingController();
//TextEditingController _emailController = TextEditingController();
//TextEditingController _phoneNumController = TextEditingController();

class AddDepartment extends StatefulWidget {
  final Function refreshDepartmentsPage;

  const AddDepartment({Key key, @required this.refreshDepartmentsPage}) : super(key: key);
  @override
  _AddDepartmentState createState() => _AddDepartmentState();

}

class _AddDepartmentState extends State<AddDepartment> {
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
                  text: 'Add Department',
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
                          hintText: 'Ao And Co',
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
                          hintText: 'Doe',
                        ),

                        SizedBox(
                          height: 20,
                        ), //common space



                        //add button
                        Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () async {
                                dynamic departmentJsonData =
                                await ApiRequests().createDepartment(Department(
                                  name: _departmentNameController.text,
                                  description: _departmentDescriptionController.text,
                                 // addedOn: null,

                                ));

                                allDepartments.add(
                                    mainDepartmentJsonDataToDepartmentModel(
                                        departmentJsonData));





                                _departmentNameController.clear();
                                _departmentDescriptionController.clear();




                                showSnackLong(context,
                                    'Department Successfully Added', false);
                              },
                              child: CommonTextButtonBig(
                                  text: 'Add Department', textSize: 17),
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
