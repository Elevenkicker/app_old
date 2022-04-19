import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PersonFieldWidget extends StatelessWidget {
  const PersonFieldWidget({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(color: Color.fromRGBO(35, 60, 128, 1)),
        height: 65,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              children: [
                Image.asset("assets/images/player_placeholder_image.png"),
                const SizedBox(width: 10),
                Text(name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "Elenvenkicker",
                      fontWeight: FontWeight.w400,
                    )),
                const Spacer(),
                InkWell(
                  splashColor: Colors.pink,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    height: 37,
                    width: 37,
                    child: Image.asset("assets/images/teamManagement/edit.png",
                        height: 10, width: 10, fit: BoxFit.scaleDown),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(35, 60, 128, 1),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(255, 0, 14, 57),
                            offset: Offset(1, 2),
                            blurRadius: 1,
                            blurStyle: BlurStyle.outer),
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
                const Gap(10),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    height: 37,
                    width: 37,
                    child: Image.asset(
                        "assets/images/teamManagement/remove.png",
                        fit: BoxFit.scaleDown),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(35, 60, 128, 1),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(255, 0, 14, 57),
                            offset: Offset(1, 2),
                            blurRadius: 1,
                            blurStyle: BlurStyle.outer),
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            )));
  }
}
