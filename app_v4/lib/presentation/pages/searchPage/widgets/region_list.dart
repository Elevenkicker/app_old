import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../data/models/region.dart';

class RegionList extends StatelessWidget {
  const RegionList({
    Key? key,
    required this.regionsList,
    required this.selectRegion,
  }) : super(key: key);

  final List<Region> regionsList;
  final Function selectRegion;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 21,
      shrinkWrap: true,
      separatorBuilder: (context, i) => const Gap(5),
      itemBuilder: (context, i) {
        return ListTile(
            textColor: Colors.white,
            tileColor: const Color.fromRGBO(25, 50, 125, 1),
            title: Text(regionsList[i].regionName),
            subtitle: const Text('Aktiv'),
            onTap: () => selectRegion(i));
      },
    );
  }
}
