part of 'homepage_bloc.dart';

@immutable
abstract class HomepageEvent {}

/// Event when "add-Button" is pressed
class AddFavouritePlayerEvent extends HomepageEvent {}

/// Event when "Player Field" is pressed
class OpenPlayerPageEvent extends HomepageEvent {}
