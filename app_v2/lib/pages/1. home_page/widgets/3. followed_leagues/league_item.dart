import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LeagueField extends StatelessWidget {
  const LeagueField({
    Key? key,
    required this.leagueId,
    required this.leagueName,
    required this.leagueRegionName,
  }) : super(key: key);

  final int leagueId;
  final String leagueName;
  final String leagueRegionName;

  void selectLeague(BuildContext context) {
    Navigator.of(context).pushNamed("/leaguePage", arguments: {
      "leagueId": leagueId,
      "leagueName": leagueName,
      "leagueRegionName": leagueRegionName,
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
              Image.asset("assets/images/ligalogos/$leagueId.png"),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(leagueName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: "Elenvenkicker",
                        fontWeight: FontWeight.w400,
                      )),
                  const Gap(1),
                  Text(leagueRegionName,
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
        onPressed: () => selectLeague(context),
      ),
    );
  }
}
