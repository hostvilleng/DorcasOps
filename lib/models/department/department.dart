import 'package:opshr/general/allExports.dart';

class Department {

  //
  final String departmentId;
  final String name;
  final String description;
  final DateTime addedOn;

  //
  final String noteAbout;

  Department({this.departmentId, @required this.name, @required this.description, @required this.addedOn, this.noteAbout});

}