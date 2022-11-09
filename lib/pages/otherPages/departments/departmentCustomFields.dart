import 'package:opshr/general/allExports.dart';
import 'package:flutter/cupertino.dart';

TextEditingController _customFieldNameController = TextEditingController();

class CustomDepartmentField extends StatefulWidget {
  @override
  _CustomDepartmentFieldState createState() => _CustomDepartmentFieldState();
}

class _CustomDepartmentFieldState extends State<CustomDepartmentField> {
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
                  text: 'Custom Fields',
                  size: 24,
                  color: AppColors().black,
                  bold: true,
                ),
                CommonText(
                  text: 'You can add custom fields to help customize the details you collect from departments',
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

                        CommonText(
                          text: 'Custom Field Name:',
                          size: 17,
                        ),
                        SizedBox(height: 12),
                        CommonTextFieldSmall(
                          controller: _customFieldNameController,
                          hintText: 'e.g Age',
                        ),

                        
                        SizedBox(
                          height: 20,
                        ), //common space

                        //add button

                        Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppColors().mainColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7))),
                                child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: CommonText(
                                    text: 'Add Custom Field',
                                    size: 17,
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
            ))));
  }
}
