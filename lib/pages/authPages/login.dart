import 'package:google_fonts/google_fonts.dart';
import 'package:opshr/general/allExports.dart';
import 'package:opshr/jsonToModels/company.dart';
import 'package:opshr/jsonToModels/user.dart';
import 'package:flutter/cupertino.dart';

import '../../main.dart';
import '../../otherWidgets.dart/font_size.dart';
import 'forget_password.dart';

TextEditingController _passwordController = TextEditingController();
TextEditingController _emailController = TextEditingController();
bool remeberMeValue = false;

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
              "Let's get you in!",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: FontSize.xxLarge,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Text(
                "Login to your account.",
                style: GoogleFonts.poppins(
                  color: const Color(0xFF595959),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
              SizedBox(
              height: 100,
            ),
            Column(

    children: [
    TextFormField(
    controller: _emailController,
    validator: (value) {
    if (_emailController.text.isEmpty) {
    return "This field can't be empty";
    }
    },
    style: GoogleFonts.poppins(
    color: const Color(0xFF777777),
    ),
    keyboardType: TextInputType.emailAddress,
    cursorColor: const Color(0xFF2693F4),
    decoration: InputDecoration(
    fillColor: const Color(0xFFDCE3EC),
    filled: true,
    hintText: "Username",
    hintStyle: GoogleFonts.poppins(
    color:  const Color(0xFF777777),
    fontSize: 16,
    fontWeight: FontWeight.w400,
    ),
    border: const OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(18)),
    ),
    ),
    ),
    SizedBox(
    height: 16,
    ),
    TextFormField(
      //obscureText: !_isVisible,
    controller: _passwordController,
    validator: (value) {
    if (_passwordController.text.isEmpty) {
    return "This field can't be empty";
    }
    },
    obscureText: !_isVisible,
    style: GoogleFonts.poppins(
    color: const Color(0xFF777777),
    ),
    keyboardType: TextInputType.visiblePassword,
    cursorColor: const Color(0xFF2693F4),
    decoration: InputDecoration(
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            _isVisible = !_isVisible;
          });
        },
        icon: _isVisible ? Icon(Icons.visibility, color: Colors.black,) :
        Icon(Icons.visibility_off, color: Colors.grey,),
      ),
    fillColor: const Color(0xFFDCE3EC),
    filled: true,
    hintText: "Password",
    hintStyle: GoogleFonts.poppins(
    color: const Color(0xFF777777),
    fontSize: 14,
    fontWeight: FontWeight.w400,
    ),
    border: const OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(18)),
    ),
    ),
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
    GestureDetector(
    onTap: () {
    Navigator.pushReplacement(
    context,
    MaterialPageRoute(
    builder: (context) =>
    ForgotPassword()));
    },
    child: Align(
    alignment: Alignment.center,
    child: Padding(
    padding: const EdgeInsets.only(top: 12),
    child: Text(
    "Forgot password?",
    style: GoogleFonts.poppins(
    color: Colors.white,
    fontSize: FontSize.medium,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.underline,
    ),
    ),
    ),
    ),
    ),
    ],
    ),



     // common space

              //  GestureDetector(
              //      onTap: () {
              //        Navigator.pop(context);
              //      },
              //      child: Icon(Icons.arrow_back, size: 24, color: Colors.black,)),

              //      SizedBox(height: 20,), //common space

      SizedBox(
        height: 100,
      ),

                    //login button

                    Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () async{
                            showDialog(context: context,
                                builder: (context){
                             return Center(child: CircularProgressIndicator());
                              },
                               );


                            if(_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {

                             dynamic authorizeData = await ApiRequests().authorizeViaPassword(_emailController.text, _passwordController.text);
                             
                             //getting the date that access token expires and saving it has a microSecondSinceEpoch int

                             int accessTokenExpiresMicroSecsToEpoch = DateTime.now().add(Duration(seconds: authorizeData["expires_in"])).microsecondsSinceEpoch;

                             authBox.put('accessTokenExpiresIn', accessTokenExpiresMicroSecsToEpoch);
                             authBox.put('accessToken', authorizeData["access_token"]);
                             authBox.put('refreshToken', authorizeData["refresh_token"]);
                             

                             userAccessToken = authorizeData["access_token"];

                             await getDataOnAppStart(); //IMPORTANT

                             
                             showSnackLong(context, 'Logged In', false);

                             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainApp()));

                            } else {

                             if(_passwordController.text.isEmpty || _passwordController.text.length < 8) {

                                showSnackLong(context, 'The password needs to be at least 8 characters long', true);

                              } else {

                                showSnackLong(context, 'Please fill all forms correctly', true);

                              }

                            }



                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors().mainColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 140, vertical: 20),
                              child: CommonText(
                                text: 'Login',
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )),

                     SizedBox(
                      height: 20,
                    ),

                    //GestureDetector(
                    //  onTap: () {

                     //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegisterPage()));

                    //  },
                    //  child: Align(
                     //                 alignment: Alignment.center,
                     //                 child: CommonText(
                     // text: 'Do not have an account? Register',
                    //  color: AppColors().mainColor,
                     // size: 15,
                       //               )),
                   // ),

                  SizedBox(
                      height: 15,
                    ),

                    //Align(
                    //  alignment: Alignment.center,
                      //child: CommonText(
                      //  text:
                       //     'The Hub is a FREE all-in-one platform that helps you automate your business e-commerce sales, finance, payroll, department management and much more',
                       // size: 15,
                        //color: Colors.grey,
                       //alignTextCenter: true,
                     // ),
                    //),

                    SizedBox(
                      height: 40,
                    ), //common space
                  ],
                ),
              ],

            ),
          //bottom info that should be in most important pages


          ),
        ),
      ),
    );
  }
}
