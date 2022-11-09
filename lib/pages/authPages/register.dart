import 'package:opshr/general/allExports.dart';
import 'package:opshr/jsonToModels/company.dart';
import 'package:opshr/jsonToModels/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:google_fonts/google_fonts.dart';



import '../../main.dart';
import '../../otherWidgets.dart/font_size.dart';
import '../../otherWidgets.dart/theme_colors.dart';

TextEditingController _firstNameController = TextEditingController();
TextEditingController _lastNameController = TextEditingController();
TextEditingController _phoneNumberController = TextEditingController();
TextEditingController _companyNameController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
  final _formKey = GlobalKey<FormState>();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.black,
      appBar: AppBar(
        backgroundColor: ThemeColors.scaffoldBgColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(
                  "New here? Welcome!",
                  style: GoogleFonts.poppins(
                    color: ThemeColors.whiteTextColor,
                    fontSize: FontSize.xxLarge,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Text(
                  "Please fill the form to continue.",
                  style: GoogleFonts.poppins(
                    color: ThemeColors.whiteTextColor,
                    fontSize: FontSize.medium,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
           Column(
    children: [
    TextFormField(
    controller: _firstNameController,
    validator: (value) {
    if (_firstNameController.text.isEmpty) {
    return "This field can't be empty";
    }
    },
    style: GoogleFonts.poppins(
    color: ThemeColors.whiteTextColor,
    ),
    keyboardType: TextInputType.name,
    cursorColor: ThemeColors.primaryColor,
    decoration: InputDecoration(
    fillColor: ThemeColors.textFieldBgColor,
    filled: true,
    hintText: "First Name",
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

      SizedBox(
    height: 16,
    ),
    TextFormField(
    controller: _lastNameController,
    validator: (value) {
    if (_lastNameController.text.isEmpty) {
    return "This field can't be empty";
    }
    },
    style: GoogleFonts.poppins(
    color: ThemeColors.whiteTextColor,
    ),
    cursorColor: ThemeColors.primaryColor,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
    fillColor: ThemeColors.textFieldBgColor,
    filled: true,
    hintText: "Last Name",
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

    SizedBox(
    height: 16,
    ),

    TextFormField(
    controller: _phoneNumberController,
    validator: (value) {
    if (_phoneNumberController.text.isEmpty) {
    return "This field can't be empty";
    }
    },
    style: GoogleFonts.poppins(
    color: ThemeColors.whiteTextColor,
    ),
    cursorColor: ThemeColors.primaryColor,
    keyboardType: TextInputType.emailAddress,
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

    SizedBox(
    height: 16,
    ),

    TextFormField(
    controller: _companyNameController,
    validator: (value) {
    if (_companyNameController.text.isEmpty) {
    return "This field can't be empty";
    }
    },
    style: GoogleFonts.poppins(
    color: ThemeColors.whiteTextColor,
    ),
    cursorColor: ThemeColors.primaryColor,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
    fillColor: ThemeColors.textFieldBgColor,
    filled: true,
    hintText: "Company Name",
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

    SizedBox(
    height: 16,
    ),

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
    cursorColor: ThemeColors.primaryColor,
    keyboardType: TextInputType.emailAddress,
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
    SizedBox(
    height: 16,
    ),

    TextFormField(
    controller: _passwordController,
    validator: (value) {
    if (_passwordController.text.isEmpty) {
    return "This field can't be empty";
    }
    },
    obscureText: true,
    style: GoogleFonts.poppins(
    color: ThemeColors.whiteTextColor,
    ),
    cursorColor: ThemeColors.primaryColor,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
    fillColor: ThemeColors.textFieldBgColor,
    filled: true,
    hintText: "Password",
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

      SizedBox(
        height: 25,
      ),
              Align(
                  alignment: Alignment.center,
                  child: CommonText(
                    text: 'Register',
                    decor: true,
                    underLine: true,
                    decorColor: AppColors().mainColor,
                  )),

              SizedBox(
                height: 15,
              ), //common












                     //login button

                     Align(
                         alignment: Alignment.center,
                         child: GestureDetector(
                           onTap: () async{

                             if(_firstNameController.text.isNotEmpty && _lastNameController.text.isNotEmpty && _emailController.text.isNotEmpty && _phoneNumberController.text.isNotEmpty && _companyNameController.text.isNotEmpty && _passwordController.text.isNotEmpty && _passwordController.text.length >= 8) {

                               bool registerResult = await ApiRequests().registerUser(User(firstName: _firstNameController.text, lastName: _lastNameController.text, email: _emailController.text, phoneNumber: _phoneNumberController.text, company: UserCompany(name: _companyNameController.text, employeeCount: 0, teamCount: 0, departmentCount: 0),), _passwordController.text);

                             if(registerResult) {

                              dynamic authorizeData = await ApiRequests().authorizeViaPassword(_emailController.text, _passwordController.text);

                              //getting the date that access token expires and saving it has a microSecondSinceEpoch int

                              int accessTokenExpiresMicroSecsToEpoch = DateTime.now().add(Duration(seconds: authorizeData["expires_in"])).microsecondsSinceEpoch;

                              authBox.put('accessTokenExpiresIn', accessTokenExpiresMicroSecsToEpoch);
                              authBox.put('accessToken', authorizeData["access_token"]);
                              authBox.put('refreshToken', authorizeData["refresh_token"]);



                              userAccessToken = authorizeData["access_token"];

                              await getDataOnAppStart(); //IMPORTANT

                              showSnackLong(context, 'Registration Completed', false);

                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainApp()));

                             } else {

                              showSnackLong(context, 'There was an issue with the Registration', true);

                             }

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
                                   horizontal: 125, vertical: 20),
                               child: CommonText(
                                 text: 'Register',
                                 size: 20,
                                 color: Colors.white,
                               ),
                             ),
                           ),
                         )),

                     SizedBox(
                       height: 15,
                     ),

                     GestureDetector(
                       onTap: () {
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                       },
                       child: Align(
                                       alignment: Alignment.center,
                                       child: CommonText(
                       text: 'Already have an account? Login',
                       color: AppColors().mainColor,
                       size: 15,
                                       )),
                     ),

                   SizedBox(
                       height: 15,
                     ),

                     //Align(
                       //alignment: Alignment.center,
                       //child: CommonText(
                        // text:
                        //     'The Hub is a FREE all-in-one platform that helps you automate your business e-commerce sales, finance, payroll, department management and much more',
                        // size: 15,
                       //  color: Colors.grey,
                     //    alignTextCenter: true,
                      /// ),
                  //   ),

                     SizedBox(
                       height: 40,
                     ), //common space
                   ],
                 ),


            ],
          ),
        ),
      ),
      ),
    );
  }
}
