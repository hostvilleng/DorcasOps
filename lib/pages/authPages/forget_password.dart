
import 'package:opshr/general/allExports.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../otherWidgets.dart/font_size.dart';
import '../../otherWidgets.dart/theme_colors.dart';


//import 'package:picco_login_ui/components/main_button.dart';



TextEditingController _emailController = TextEditingController();


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key key}) : super(key: key);

 // final _formKey = GlobalKey<FormState>();
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
    child: SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    "Let's Reset your password!",
    style: GoogleFonts.poppins(
    color: ThemeColors.whiteTextColor,
    fontSize: FontSize.xxLarge,
    fontWeight: FontWeight.w600,
    ),
    ),
    Padding(
    padding: const EdgeInsets.only(top: 7),
    child: Text(
    "reset in seconds.",
    style: GoogleFonts.poppins(
      color: ThemeColors.whiteTextColor,
    fontSize: FontSize.medium,
    fontWeight: FontWeight.w600,
    ),
    ),
    ),
    const SizedBox(height: 70),

     Column(
    children: [
    ///Email Input Field
    TextFormField(
    controller: _emailController,
    validator: (value) {
    if (_emailController.text.isEmpty) {
    return "This field can't be empty";
    }
    },
    style: GoogleFonts.poppins(
    color: ThemeColors.whiteTextColor,
    ),
    keyboardType: TextInputType.emailAddress,
    cursorColor: ThemeColors.primaryColor,
    decoration: InputDecoration(
    fillColor: ThemeColors.textFieldBgColor,
    filled: true,
    hintText: "E-mail",
    hintStyle: GoogleFonts.poppins(
    color: ThemeColors.textFieldHintColor,
    fontSize: FontSize.medium,
    fontWeight: FontWeight.w400,
    ),
    border: const OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(18)),
    ),
    ),
    ),

    const SizedBox(
           height: 40,
         ),

         Row(
           mainAxisAlignment: MainAxisAlignment.end,
           children: [
             GestureDetector(
               onTap: () {
                 Navigator.pushReplacement(
                     context,
                     MaterialPageRoute(
                         builder: (context) =>  LoginPage()));
               },
               child: const Align(
                   alignment: Alignment.center,
                   child: Text(
                      'Return to Login?',
                     style: TextStyle(
                       color: Color(0xff375BE9),
                       fontSize: 15,
                     ),

                   )),
             ),
           ],
         ),

         SizedBox(
           height: 40,
         ),

         //login button

         Container(
           decoration: const BoxDecoration(
               color: ThemeColors.primaryColor,
               borderRadius:
               BorderRadius.all(Radius.circular(20))),
           child: const Padding(
             padding: EdgeInsets.symmetric(
                 horizontal: 70, vertical: 10),
             child: Text(
                'Reset Password',
               style: TextStyle(
                 fontSize: 25,
                 color: Colors.white,
               ),

             ),
           ),
         ),

         SizedBox(
           height: 30,
         ),
    ]
      ),

      ],
    ),
        ),
      ),
    ),
    );
  }
}
