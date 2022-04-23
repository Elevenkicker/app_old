import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../data/models/team.dart';
import '../../../../../routes/routes.gr.dart';

class TeamFieldItem extends StatelessWidget {
  const TeamFieldItem({
    Key? key,
    required this.team,
  }) : super(key: key);

  final Team team;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
          backgroundColor:
              MaterialStateProperty.all(const Color.fromRGBO(35, 60, 128, 1)),
          elevation: MaterialStateProperty.all(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              Image.asset(
                  "assets/images/vereinslogos/${team.leagueId}/${team.teamName1}.png"),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(team.teamName2,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: "Elenvenkicker",
                        fontWeight: FontWeight.w400,
                      )),
                  const Gap(1),
                  Text(team.regionName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontFamily: "Elenvenkicker",
                        fontWeight: FontWeight.w200,
                      ))
                ],
              )
            ],
          ),
        ),
        onPressed: () => context.router.push(TeamRoute(teamId: team.teamId)),
      ),
    );
  }
}
