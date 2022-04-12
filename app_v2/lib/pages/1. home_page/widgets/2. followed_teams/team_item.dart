import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TeamField extends StatelessWidget {
  const TeamField({
    Key? key,
    required this.teamId,
    required this.teamName,
    required this.teamLeagueName,
  }) : super(key: key);

  final int teamId;
  final String teamName;
  final String teamLeagueName;

  void selectTeam(BuildContext context, {teamId}) {
    Navigator.of(context).pushNamed("/teamPage", arguments: {
      "teamId": teamId,
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.only(left: 10)),
          backgroundColor:
              MaterialStateProperty.all(const Color.fromRGBO(35, 60, 128, 1)),
          elevation: MaterialStateProperty.all(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              Image.asset("assets/images/vereinslogos/$teamId.png"),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(teamName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: "Elenvenkicker",
                        fontWeight: FontWeight.w400,
                      )),
                  const Gap(1),
                  Text(teamLeagueName,
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
        onPressed: () => selectTeam(context, teamId: teamId),
      ),
    );
  }
}
