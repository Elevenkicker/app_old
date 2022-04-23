import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FollowedTeamsField extends StatelessWidget {
  const FollowedTeamsField({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(25, 50, 125, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text(title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: "Elenvenkicker",
                  fontWeight: FontWeight.w600,
                )),
            const SizedBox(height: 20),
            // ListView.separated(
            //   physics: const NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   itemCount: favouritePlayers.length,
            //   separatorBuilder: (BuildContext context, int index) =>
            //       const Gap(10),
            //   itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
            //     value: favouritePlayers[i],
            //     child: const FollowedPlayerItem(),
            //   ),
            // ),
            const Gap(10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  child: const Icon(Icons.add, color: Colors.white, size: 40),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(35, 60, 128, 1)),
                    elevation: MaterialStateProperty.all(5),
                  ),
                  onPressed: () {}
                  // => openAddFavouritePlayerScreen(context),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
