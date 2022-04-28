import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../data/models/team.dart';

class TeamList extends StatelessWidget {
  const TeamList({
    Key? key,
    required this.teamList,
    required this.openTeamPage,
  }) : super(key: key);

  final List<Team> teamList;
  final Function openTeamPage;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: teamList.length,
        separatorBuilder: (context, i) => const Gap(5),
        itemBuilder: (context, i) {
          return ListTile(
              leading: Image.network(
                  'http://34.159.133.82:5000/get_team_logo?leagueId=${teamList[i].leagueId}&regionName=${teamList[i].regionName}&teamId=${teamList[i].teamId}&apiKey=Dw8FUgy7VFrs9Gfs4VNfp6UVey6NBjd2DYy'),
              textColor: Colors.white,
              tileColor: const Color.fromRGBO(25, 50, 125, 1),
              title: Text('${teamList[i].teamName2}'),
              subtitle: Text('${teamList[i].regionName}'),
              onTap: () => openTeamPage(teamList[i].teamId));
        });
  }
}
