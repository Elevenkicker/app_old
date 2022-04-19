import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PersonSectionWidget extends StatelessWidget {
  const PersonSectionWidget({
    Key? key,
    required this.title,
    this.child,
  }) : super(key: key);

  final String title;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            const Gap(5),
            Text(title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: "Elenvenkicker",
                  fontWeight: FontWeight.w300,
                )),
          ],
        ),
        const Gap(5),
        child ?? const Gap(0),
        const Gap(10),
        child ?? const Gap(0),
      ],
    );
  }
}
