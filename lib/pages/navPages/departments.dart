import 'package:opshr/general/allExports.dart';
import 'package:ionicons/ionicons.dart';

List<Department> allDepartments = [

  // Department(firstName: 'OlaOluwa', lastName: 'Adeyemo', email: 'olaoluwaadeyemo7@gmail.com', phoneNumber: '09073237764', addedOn: DateTime.now(), noteAbout: 'Thank GOD.'),
  // Department(firstName: 'Mike', lastName: 'Lawal', email: 'lawal@gmail.com', phoneNumber: '0903989222', addedOn: DateTime.now(), noteAbout: 'Thank GOD.'),

];



class Departments extends StatefulWidget {
  @override
  _DepartmentsState createState() => _DepartmentsState();
}

class _DepartmentsState extends State<Departments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
              child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: 'Departments',
                  size: 24,
                  color: AppColors().black,
                  bold: true,
                ),


                SizedBox(height: 20),


                BasicItemWidget(icon: Ionicons.person_add_outline, title: 'Add Department', onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddDepartment()));
                },),
                MyDivider(),
                BasicItemWidget(icon: Ionicons.people_outline, title: 'Manage Departments', onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ManageDepartments()));
                },),
                MyDivider(),


                SizedBox(height: 20,),

               

               



              ],
                )
                )
                )
    );
  }
}
