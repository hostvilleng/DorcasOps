import 'package:opshr/general/allExports.dart';

class Employee {

  //
  final String employeeId;
  final String firstName;
  final String lastName;
  final String gender;
  final String email;
  final int phoneNumber;
  final int salaryAmount;
  final int staffCode;
  final String jobTitle;

  final DateTime addedOn;

  //
 // final String noteAbout;
  Employee({this.employeeId, @required this.firstName, @required this.lastName, @required this.gender,@required this.email,
    @required this.salaryAmount, @required this.staffCode,@required this.jobTitle, @required this.phoneNumber, @required this.addedOn, });

}