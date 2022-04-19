import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'person_section_widget.dart';
import 'person_feld_widget.dart';

class TeamManagementSpieler extends StatelessWidget {
  const TeamManagementSpieler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(20),
        const Text("Spieler",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontFamily: "Elenvenkicker",
              fontWeight: FontWeight.w500,
            )),
        const Gap(10),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromRGBO(25, 50, 125, 1),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    PersonSectionWidget(
                      title: "Torwart",
                      child: PersonFieldWidget(name: "Name"),
                    ),
                    Gap(20),
                    PersonSectionWidget(
                        title: "LV", child: PersonFieldWidget(name: "Name")),
                    Gap(20),
                    PersonSectionWidget(
                        title: "IV", child: PersonFieldWidget(name: "Name")),
                    Gap(20),
                    PersonSectionWidget(
                        title: "RV", child: PersonFieldWidget(name: "Name")),
                    Gap(20),
                    PersonSectionWidget(
                        title: "LM", child: PersonFieldWidget(name: "Name")),
                    Gap(20),
                    PersonSectionWidget(
                        title: "ZM", child: PersonFieldWidget(name: "Name")),
                    Gap(20),
                    PersonSectionWidget(
                        title: "RM", child: PersonFieldWidget(name: "Name")),
                    Gap(20),
                    PersonSectionWidget(
                        title: "ST", child: PersonFieldWidget(name: "Name")),
                    Gap(20),
                    PersonSectionWidget(
                        title: "Spieler ohne Position",
                        child: PersonFieldWidget(name: "Name")),
                  ],
                ),
                const Gap(20),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                  "assets/images/teamManagement/add.png",
                                  height: 35),
                              const Gap(5),
                              const Text("Spieler hinzufügen"),
                            ]),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          primary: const Color.fromRGBO(35, 60, 128, 1),
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "Elenvenkicker",
                            fontWeight: FontWeight.w300,
                          ),
                          elevation: 5,
                        ),
                        onPressed: () {})),
              ],
            ),
          ),
        ),
        const Gap(20),
      ],
    );
  }
}
