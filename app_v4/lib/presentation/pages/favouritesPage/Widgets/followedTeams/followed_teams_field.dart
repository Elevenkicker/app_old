import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../data/models/team.dart';
import 'team_field_roundItem.dart';

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
        padding: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 5),
        child: Column(
          children: [
            Text(title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: "Elenvenkicker",
                  fontWeight: FontWeight.w600,
                )),
            const Gap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: favouriteTeams.length,
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1 / 1,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, i) =>
                        TeamFieldRoundedItem(team: favouriteTeams[i]),
                  ),
                ),
                const Gap(10),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                      child:
                          const Icon(Icons.add, color: Colors.white, size: 40),
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

            const Gap(10),
            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton(
            //       child: const Icon(Icons.add, color: Colors.white, size: 40),
            //       style: ButtonStyle(
            //         backgroundColor: MaterialStateProperty.all(
            //             const Color.fromRGBO(35, 60, 128, 1)),
            //         elevation: MaterialStateProperty.all(5),
            //       ),
            //       onPressed: () {}
            //       // => openAddFavouritePlayerScreen(context),
            //       ),
            // ),
          ],
        ),
      ),
    );
  }
}
