import 'package:opshr/general/allExports.dart';
import 'package:flutter/cupertino.dart';

TextEditingController _departmentNameController = TextEditingController();
TextEditingController _departmentDescriptionController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _phoneNumController = TextEditingController();

class PersonalSettings extends StatefulWidget {
  @override
  _PersonalSettingsState createState() => _PersonalSettingsState();
}

class _PersonalSettingsState extends State<PersonalSettings> {
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
                  text: 'Personal Information',
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
                          text: 'FirstName:',
                          size: 17,
                        ),
                        SizedBox(height: 12),
                        CommonTextFieldSmall(
                          controller: _departmentNameController,
                          hintText: 'John',
                        ),

                        SizedBox(
                          height: 20,
                        ), //common space

                        CommonText(
                          text: 'LastName:',
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

                        CommonText(
                          text: 'Email:',
                          size: 17,
                        ),
                        SizedBox(height: 12),
                        CommonTextFieldSmall(
                          controller: _emailController,
                          hintText: 'johndoe@gmail.com',
                        ),

                        SizedBox(
                          height: 20,
                        ), //common space

                        CommonText(
                          text: 'Phone Number:',
                          size: 17,
                        ),
                        SizedBox(height: 12),
                        CommonTextFieldSmall(
                          controller: _phoneNumController,
                          hintText: '08012345678',
                        ),

                        SizedBox(
                          height: 20,
                        ), //common space

                        //add button

                        Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {},
                              child: CommonTextButtonBig(text: 'Update Profile', textSize: 17),
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
