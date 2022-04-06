import 'package:flutter/material.dart';

class TeamField extends StatelessWidget {
  const TeamField({
    Key? key,
    required this.teamName,
    required this.teamLeagueName,
  }) : super(key: key);

  final String teamName;
  final String teamLeagueName;

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
                  Text(teamName,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 20)),
                  Text(teamLeagueName,
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
