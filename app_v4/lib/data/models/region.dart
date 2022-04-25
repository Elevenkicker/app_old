import 'league.dart';

class Region {
  Region({
    required this.regionName,
    required this.regionLeagues,
  });

  final String regionName;
  final int regionId = 1;
  List<League> regionLeagues = [];
  bool isActive = false;

  Region.fromJson(Map value) : regionName = value['regionName'];
}
