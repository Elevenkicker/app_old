import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'person_feld_widget.dart';
import 'person_section_widget.dart';

class TeamManagementTrainerstab extends StatelessWidget {
  const TeamManagementTrainerstab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(20),
        const Text("Trainerstab",
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    PersonSectionWidget(
                      title: "Trainer",
                      child: PersonFieldWidget(name: "Name"),
                    ),
                    Gap(20),
                    PersonSectionWidget(
                        title: "Co-Trainer",
                        child: PersonFieldWidget(name: "Name")),
                    Gap(20),
                    PersonSectionWidget(
                        title: "Betreuer",
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
                              const Text("Trainer/Betreuer hinzufügen"),
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
      ],
    );
  }
}
