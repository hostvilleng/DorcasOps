//this is the start of the app, where some basic logic will first go through before the user is taken into the main app
import 'package:opshr/jsonToModels/allDepartments.dart';
import 'package:opshr/jsonToModels/allEmployees.dart';
//import 'package:opshr/jsonToModels/allPayrolls.dart';

import 'package:opshr/jsonToModels/allTeams.dart';
import 'package:opshr/jsonToModels/company.dart';
import 'package:opshr/jsonToModels/user.dart';
import 'package:opshr/pages/authPages/parentAuth.dart';
import 'package:opshr/pages/navPages/departments.dart';
import 'package:hive/hive.dart';
import 'package:ionicons/ionicons.dart';
import 'package:opshr/general/allExports.dart';

import '../jsonToModels/allPayrolls.dart';
import '../jsonToModels/allProducts.dart';
import '../main.dart';
import '../pages/otherPages/employees/addEmployees.dart';
import '../pages/otherPages/teams/addTeams.dart';

String userAccessToken;

User currentuser;

final _pages = [
  //BottomNavIcons(
   // 'Home',
   // Ionicons.home_outline,
   // HomePage(),
  //),
   BottomNavIcons(
     'Home',
     Ionicons.people_outline,
     HomePage(),
   ),
  BottomNavIcons(
    'Notifications',
    Ionicons.pricetags_outline,
    Sales(),
  ),
  BottomNavIcons(
    'Task',
    Ionicons.pricetags_outline,
    Sales(),
  ),
  BottomNavIcons(
    'Settings',
    Ionicons.settings_outline,
    SettingsPage(),
  ),
   BottomNavIcons(
     'More',
     Ionicons.list_outline,
     More(),
   ),
];

DateTime taskDate = DateTime.now();

TextEditingController test = TextEditingController();

Function refreshAppLoader;

int selectedPageIndex = 0;

lauchApp() async {
  //functions that need to be run at the start of the app

  int expiresIn = authBox.get('accessTokenExpiresIn');
  String accessToken = authBox.get('accessToken');

  if (expiresIn != null && accessToken != null) {
    if (DateTime.now().add(Duration(days: 1)).microsecondsSinceEpoch >=
        expiresIn) {
      return 'unAuth';
    } else {
      userAccessToken = accessToken;

      await getDataOnAppStart(); //IMPORTANT

      return accessToken;
    }
  } else {
    return 'unAuth';
  }
}

class AppLoader extends StatefulWidget {
  @override
  _AppLoaderState createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: lauchApp(), //IMPORTANT
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
              backgroundColor: AppColors().scaffoldColor,
              body: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                    CommonText(
                      text: 'Dorcas Hub',
                      size: 30,
                    ),
                  ])));
        } else {
          if (snapshot.data == 'unAuth') {
            return ParentAuth();
          } else {
            return MainApp();
          }
        }
      },
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({Key key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    refreshAppLoader = () {
      setState(() {});
    };

    return Scaffold(
        backgroundColor: AppColors().scaffoldColor,
        body: Center(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: _pages[selectedPageIndex].page,
        )),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedPageIndex,
            onTap: (int pageIndex) {
              selectedPageIndex = pageIndex;
              refreshAppLoader();
            },
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            backgroundColor: AppColors().textWhite,
            selectedLabelStyle: TextStyle(
              color: AppColors().mainColor,
              fontSize: 14,
              fontWeight: FontWeight.normal,
              fontFamily: 'GoogleFonts.poppins',
              fontFamilyFallback: <String>[
                'Noto',
              ],
            ),
            unselectedLabelStyle: TextStyle(
              color: AppColors().darkGrey,
              fontSize: 14,
              fontWeight: FontWeight.normal,
              fontFamily: 'Sans',
              fontFamilyFallback: <String>[
                'Noto',
              ],
            ),
            selectedItemColor: AppColors().mainColor,
            unselectedItemColor: AppColors().darkGrey,
            items: _pages.map((i) {
              return BottomNavigationBarItem(
                icon: Icon(i.pageIcon, color: AppColors().darkGrey, size: 23),
                activeIcon:
                    Icon(i.pageIcon, color: AppColors().mainColor, size: 23),
                label: i.pageName,
              );
            }).toList()));
  }
}

//function to be run on logout
logoutThisUser(BuildContext context) async{
  //clear out the accessToken and expiryData from hive
  await authBox.delete('accessTokenExpiresIn');
  await authBox.delete('accessToken');

  //clear other data
  currentuser = null;
  userAccessToken = null;
  allProducts = [];
  invoices = [];
  allDepartments = [];
  //allPayrolls = [];
  allEmployees = [];
  allTeams= [];
 // allTask= [];


  //push to login page

  return 'done';
}

//function to retrive all need able data on app start
getDataOnAppStart() async {
  //firstly clear past list data
  allProducts = [];
  invoices = [];
  allDepartments = [];
 // allPayrolls = [];
  allEmployees = [];
  allTeams= [];


  //company data
  dynamic companyJsonData = await ApiRequests().retrieveCompanyData();

  //user data
  dynamic userJsonData = await ApiRequests().retrieveUserData();

  User userData = userJsonDataToUserModel(userJsonData, companyJsonData);

  currentuser = userData;

  //all products
  //dynamic productsJsonData = await ApiRequests().listProducts();
  //allProductsJsonDataToIndividualProductModel(productsJsonData);

  //all orders
  //dynamic ordersJsonData = await ApiRequests().listOrders();
  //allOrdersJsonDataToIndividualOrderModel(ordersJsonData);

  //all departments
  dynamic departmentsJsonData = await ApiRequests().listDepartments();
  allDepartmentsJsonDataToIndividualDepartmentModel(departmentsJsonData);

  //all employees
  dynamic employeesJsonData = await ApiRequests().listEmployees();
  allEmployeesJsonDataToIndividualEmployeeModel(employeesJsonData);

  //all teams
  dynamic teamsJsonData = await ApiRequests().listTeams();
  allTeamsJsonDataToIndividualTeamModel(teamsJsonData);

  //all employees
  //dynamic employeesJsonData =await ApiRequests().listEmployees();
  //allEmployeeJsonDataToIndividualEmployeeModel(employeesJsonData);


  //all payrolls
 //dynamic payrollsJsonData = await ApiRequests().list();
 //allPayrollsJsonDataToIndividualPayrollModel(payrollsJsonData);



  print('got here');

  return 'done';
}
