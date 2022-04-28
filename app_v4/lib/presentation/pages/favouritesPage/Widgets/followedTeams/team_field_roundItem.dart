import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../../data/models/team.dart';
import '../../../../routes/routes.gr.dart';

class TeamFieldRoundedItem extends StatelessWidget {
  const TeamFieldRoundedItem({
    Key? key,
    required this.team,
  }) : super(key: key);

  final Team team;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: SizedBox(
        width: 100,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100))),
            padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
            backgroundColor:
                MaterialStateProperty.all(const Color.fromRGBO(35, 60, 128, 1)),
            elevation: MaterialStateProperty.all(5),
          ),
          child: Image.asset(
              "assets/images/vereinslogos/${team.leagueId}/${team.teamName1!}.png"),
          onPressed: () => context.router.push(TeamRoute(teamId: team.teamId!)),
        ),
      ),
    );
  }
}
