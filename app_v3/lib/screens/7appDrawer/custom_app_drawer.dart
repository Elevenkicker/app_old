import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../6teamManagerScreen/team_manager_screen.dart';

class CustomAppDrawer extends StatelessWidget {
  const CustomAppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(16, 38, 102, 1),
      child: Column(
        children: [
          const Gap(50),
          Container(
              height: 40,
              width: double.infinity,
              decoration: const BoxDecoration(),
              child: const Center(
                child: Text("Menü",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    )),
              )),
          const Gap(10),
          Container(height: 0.5, color: Colors.white),
          const Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints.tightFor(
                      width: double.infinity, height: 50),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(25, 50, 125, 1),
                    ),
                    child: const Text("Player Management",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    onPressed: () {},
                  ),
                ),
                const Gap(15),
                ConstrainedBox(
                  constraints: const BoxConstraints.tightFor(
                      width: double.infinity, height: 50),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(25, 50, 125, 1),
                    ),
                    child: const Text("Team Management",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context)
                          .pushNamed(TeamManagerScreen.screenName);
                    },
                  ),
                ),
                const Gap(30),
                ConstrainedBox(
                  constraints: const BoxConstraints.tightFor(
                      width: double.infinity, height: 50),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(25, 50, 125, 0.5),
                      elevation: 0,
                    ),
                    child: const Text("About us",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
