import 'package:opshr/general/allExports.dart';

class Team {

  //
  final String teamId;
  final String name;
  final String description;
  final DateTime addedOn;

  //
  // final String noteAbout;
  Team(
      {this.teamId, @required this.name, @required this.description, @required this.addedOn,});
}
