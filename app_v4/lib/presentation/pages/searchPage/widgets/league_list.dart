import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../data/models/league.dart';

class LeagueList extends StatelessWidget {
  const LeagueList({
    Key? key,
    required this.leagueList,
    required this.selectLeague,
  }) : super(key: key);

  final List<League> leagueList;
  final Function selectLeague;

  @override
  Widget build(BuildContext context) {
    leagueList.removeWhere((league) => league.leagueId == 335065);
    leagueList.sort((a, b) => a.leagueHeight.compareTo(b.leagueHeight));
    return ListView.separated(
      itemCount: leagueList.length,
      separatorBuilder: (context, i) => const Gap(5),
      itemBuilder: (context, i) {
        return ListTile(
            leading: Image.network(
                'http://34.159.133.82:5000/get_league_logo?apiKey=Dw8FUgy7VFrs9Gfs4VNfp6UVey6NBjd2DYy&leagueId=${leagueList[i].leagueId!.toInt()}'),
            textColor: Colors.white,
            tileColor: const Color.fromRGBO(25, 50, 125, 1),
            title: Text(leagueList[i].leagueName!),
            subtitle: Text(leagueList[i].regionName),
            onTap: () => selectLeague(i));
      },
    );
  }
}
