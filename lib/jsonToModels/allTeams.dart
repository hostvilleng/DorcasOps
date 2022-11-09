import 'package:opshr/general/allExports.dart';

import '../pages/otherPages/teams/addTeams.dart';
import 'team.dart';



List<Team> allTeamsJsonDataToIndividualTeamModel(
    dynamic teamsJsonData) {
  Map data = teamsJsonData;

  List allTeamsJsonData = data['data'];

  for (var i = 0; i < allTeamsJsonData.length; i++) {

    allTeams.add(teamJsonDataToTeamModel(allTeamsJsonData[i]));
  }

  return allTeams;
}