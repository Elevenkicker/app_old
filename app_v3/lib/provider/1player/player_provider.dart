import 'package:flutter/material.dart';

class PlayerProvider with ChangeNotifier {
  PlayerProvider({
    required this.id,
    required this.name,
    required this.role,
    required this.parentId,
    required this.parentName,
    required this.isFavourite,
  });

  int id;
  String name;
  String role;
  int parentId;
  String parentName;

  bool isFavourite = false;

  toggleFavouriteStatus() {
    isFavourite = !isFavourite;
  }
}
