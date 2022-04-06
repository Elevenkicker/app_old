part of 'favouriteplayers_bloc.dart';

@immutable
abstract class FavouriteplayersEvent {}

// Player
/// Event when "Player Field" is pressed
class OpenPlayerPageEvent extends FavouriteplayersEvent {}

// Player
/// Event when "add-Button" is pressed
class AddFavouritePlayerEvent extends FavouriteplayersEvent {}
