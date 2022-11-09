import 'package:opshr/general/allExports.dart';
import 'package:flutter/cupertino.dart';

//
TextEditingController _businessNameController = TextEditingController();
TextEditingController _regNumberController = TextEditingController();
TextEditingController _contactPhoneController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _websiteController = TextEditingController();

//
TextEditingController _addressLine1Controller = TextEditingController();
TextEditingController _addressLine2Controller = TextEditingController();
TextEditingController _cityController = TextEditingController();
TextEditingController _stateController = TextEditingController();

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
                    text: 'Business Information',
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
                            text: 'Business Name:',
                            size: 17,
                          ),
                          SizedBox(height: 12),
                          CommonTextFieldSmall(
                            controller: _businessNameController,
                            hintText: 'John',
                          ),

                          SizedBox(
                            height: 20,
                          ), //common space

                          CommonText(
                            text: 'Business Registration Number:',
                            size: 17,
                          ),
                          SizedBox(height: 12),
                          CommonTextFieldSmall(
                            controller: _regNumberController,
                            hintText: '',
                          ),

                          SizedBox(
                            height: 20,
                          ), //common space

                          CommonText(
                            text: 'Contact Phone:',
                            size: 17,
                          ),
                          SizedBox(height: 12),
                          CommonTextFieldSmall(
                            controller: _contactPhoneController,
                            hintText: '+234',
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
                            hintText: 'business@email.com',
                          ),

                          SizedBox(
                            height: 20,
                          ), //common space

                          CommonText(
                            text: 'Website Link:',
                            size: 17,
                          ),
                          SizedBox(height: 12),
                          CommonTextFieldSmall(
                            controller: _websiteController,
                            hintText: 'https//:',
                          ),

                          SizedBox(
                            height: 20,
                          ), //common space

                          //add button

                          Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () {},
                                child: CommonTextButtonBig(
                                    text: 'Update Business Profile',
                                    textSize: 17),
                              )),

                          SizedBox(
                            height: 10,
                          ),
                          MyDivider(),
                          SizedBox(
                            height: 10,
                          ),

                          CommonText(
                            text: 'Address Information',
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
                                    text: 'Address Line 1:',
                                    size: 17,
                                  ),
                                  SizedBox(height: 12),
                                  CommonTextFieldSmall(
                                    controller: _addressLine1Controller,
                                    hintText: '',
                                  ),

                                  SizedBox(
                                    height: 20,
                                  ), //common space

                                  CommonText(
                                    text: 'Address Line 2:',
                                    size: 17,
                                  ),
                                  SizedBox(height: 12),
                                  CommonTextFieldSmall(
                                    controller: _addressLine2Controller,
                                    hintText: '',
                                  ),

                                  SizedBox(
                                    height: 20,
                                  ), //common space

                                  CommonText(
                                    text: 'State:',
                                    size: 17,
                                  ),
                                  SizedBox(height: 12),
                                  CommonTextFieldSmall(
                                    controller: _stateController,
                                    hintText: '',
                                  ),

                                  SizedBox(
                                    height: 20,
                                  ), //common space

                                  CommonText(
                                    text: 'City:',
                                    size: 17,
                                  ),
                                  SizedBox(height: 12),
                                  CommonTextFieldSmall(
                                    controller: _cityController,
                                    hintText: '',
                                  ),

                                  SizedBox(
                                    height: 20,
                                  ), //common space

                                  //add button

                                  Align(
                                      alignment: Alignment.center,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: CommonTextButtonBig(
                                            text: 'Update Profile',
                                            textSize: 17),
                                      )),

                                  SizedBox(
                                    height: 10,
                                  ),
                                  MyDivider(),
                                  SizedBox(
                                    height: 10,
                                  ),

                                  CommonText(
                                    text: 'MarketPlace',
                                    size: 24,
                                    color: AppColors().black,
                                    bold: true,
                                  ),

                                  SizedBox(height: 20),

                                  SizedBox(
                                    height: 20,
                                  ),
                                ]),
                          )
                        ],
                      ))
                ]))));
  }
}
