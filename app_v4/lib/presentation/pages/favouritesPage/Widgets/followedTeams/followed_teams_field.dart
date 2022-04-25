import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../data/models/team.dart';
import 'team_field_item.dart';

class FollowedTeamsField extends StatelessWidget {
  FollowedTeamsField({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  final List<Team> favouriteTeams = [
    Team(
        leagueId: 335000,
        clubId: '00ES8GN9DO000013VV0AG08LVUPGND5I',
        teamId: '011MIANVN4000000VTVG0001VTR8C1K7',
        teamName1: 1,
        teamName2: 'SF Eintracht Freiburg',
        regionName: 'Südbaden'),
    Team(
        leagueId: 335000,
        clubId: '00ES8GN9DO00000NVV0AG08LVUPGND5I',
        teamId: '011MIF62LO000000VTVG0001VTR8C1K7',
        teamName1: 2,
        teamName2: 'SV Solvay Freiburg',
        regionName: 'Südbaden'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(25, 50, 125, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text(title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: "Elenvenkicker",
                  fontWeight: FontWeight.w600,
                )),
            const SizedBox(height: 20),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: favouriteTeams.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Gap(10),
              itemBuilder: (ctx, i) => TeamFieldItem(team: favouriteTeams[i]),
            ),
            const Gap(10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  child: const Icon(Icons.add, color: Colors.white, size: 40),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(35, 60, 128, 1)),
                    elevation: MaterialStateProperty.all(5),
                  ),
                  onPressed: () {}
                  // => openAddFavouritePlayerScreen(context),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
