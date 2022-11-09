//import 'dart:convert';

import 'package:opshr/general/allExports.dart';



Team teamJsonDataToTeamModel(dynamic teamJsonData) {
 dynamic data = teamJsonData;

  return Team(
      teamId: data['id'],
      name: data['name'],
      description: data['description'],
      addedOn: DateTime.parse(data['created_at']));
}

Team mainTeamJsonDataToTeamModel(dynamic teamJsonData) {
  Map data = teamJsonData;

  return Team(
      teamId: data['id'],
      name: data['data']['name'],
      description: data['data']['description'],
      addedOn: DateTime.parse(data['data']['created_at']));
}
