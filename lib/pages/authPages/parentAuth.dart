import 'package:opshr/general/allExports.dart';
import 'package:flutter/cupertino.dart';

import '../../main.dart';

TextEditingController _passwordController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _businessServerNameController = TextEditingController();

//list of host servers

String _selectedHostName = 'Dorcas Hub';
List<String> serverNames = [

  'GT Bank',
  'Dorcas Hub'

];


class ParentAuth extends StatefulWidget {
  @override
  _ParentAuthState createState() => _ParentAuthState();
}

class _ParentAuthState extends State<ParentAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ), //common space

              
              SizedBox(
                height: 20,
              ), //common space

              Align(
                  alignment: Alignment.center,
                  child: CommonText(
                    text: 'Host Authentication',
                    decor: true,
                    underLine: true,
                    decorColor: AppColors().mainColor,
                  )),

              

              SizedBox(
                height: 25,
              ), //common space

              //login form

              Container(
                constraints: BoxConstraints(maxWidth: 700),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    CommonText(
                      text: 'Select a Host Server',
                      size: 17,
                    ),
                    SizedBox(height: 8),
                    CommonDropDown(
                                      options: serverNames,
                                      currentValue: _selectedHostName,
                                      onChanged: (v) {

                                        setState(() {
                                          _selectedHostName = v;
                                        });
                                        
                                      }),

                    SizedBox(
                      height: 20,
                    ), //common space

                                      
                    CommonText(
                      text: 'Your Email:',
                      size: 17,
                    ),
                    SizedBox(height: 8),
                    CommonTextFieldSmall(
                      controller: _emailController,
                      hintText: 'Your email',
                    ),

                    SizedBox(
                      height: 20,
                    ), //common space

                    

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CommonText(
                          text: 'Your Password:',
                          size: 17,
                        ),
                        CommonText(
                          text: 'Forgot Password?',
                          size: 14,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    CommonTextFieldSmall(
                      controller: _passwordController,
                      hintText: 'Your Account Password',
                    ),

                    SizedBox(
                      height: 10,
                    ), //common space

                    //common space

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                       
                          Checkbox(
                            value: remeberMeValue,
                            onChanged: (newValue) {
                              setState(() {
                                remeberMeValue = newValue;
                              });
                            },
                            activeColor: AppColors().mainColor,
                          ),
                        
                        CommonText(
                          text: 'Remember me',
                          size: 15,
                          color: Colors.grey,
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 25,
                    ),

                    //login button

                    Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () async{

                            


                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors().mainColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 5),
                              child: CommonText(
                                text: 'Login',
                                size: 17,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )),

                     SizedBox(
                      height: 15,
                    ),

                  //   GestureDetector(
                  //     onTap: () {

                  //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegisterPage()));

                  //     },
                  //     child: Align(
                  //                     alignment: Alignment.center,
                  //                     child: CommonText(
                  //     text: 'Do not have an account? Register',
                  //     color: AppColors().mainColor,
                  //     size: 15,
                  //                     )),
                  //   ),

                  // SizedBox(
                  //     height: 15,
                  //   ),

                    Align(
                      alignment: Alignment.center,
                      child: CommonText(
                        text:
                            'The Hub is a FREE all-in-one platform that helps you automate your business e-commerce sales, finance, payroll, department management and much more',
                        size: 15,
                        color: Colors.grey,
                        alignTextCenter: true,
                      ),
                    ),

                    SizedBox(
                      height: 40,
                    ), //common space
                  ],
                ),
              ),

              //bottom info that should be in most important pages
              BottomInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
