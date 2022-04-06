import 'package:flutter/material.dart';

class LeagueField extends StatelessWidget {
  const LeagueField({
    Key? key,
    required this.leagueName,
    required this.leagueRegionName,
  }) : super(key: key);

  final String leagueName;
  final String leagueRegionName;

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
        onPressed: null,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              Image.asset("assets/images/player_placeholder_image.png"),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(leagueName,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 20)),
                  Text(leagueRegionName,
                      style: const TextStyle(color: Colors.white, fontSize: 10))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
