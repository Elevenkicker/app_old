import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import '../../../../provider/team/teams_provider.dart';

class AddFavouriteLeague extends StatefulWidget {
  const AddFavouriteLeague({Key? key}) : super(key: key);

  static const screenName = "/addFavouriteLeague";

  @override
  State<AddFavouriteLeague> createState() => _AddFavouriteLeagueState();
}

class _AddFavouriteLeagueState extends State<AddFavouriteLeague> {
  @override
  Widget build(BuildContext context) {
    final teamsData = Provider.of<TeamsProvider>(context);
    final teams = teamsData.nonFavouriteTeams;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(16, 38, 102, 1),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.separated(
          itemCount: teams.length,
          separatorBuilder: (context, index) {
            return const Gap(10);
          },
          itemBuilder: (context, index) {
            return InkWell(
                child: Container(
                  color: const Color.fromRGBO(25, 50, 125, 1),
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/vereinslogos/${teams[index].teamId}.png",
                        ),
                        const Gap(10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              teams[index].teamName,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              teams[index].leagueName,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  teams[index].toggleFavouriteStatus();
                  Navigator.of(context).pop();
                });
          },
        ),
      ),
    );
  }
}
