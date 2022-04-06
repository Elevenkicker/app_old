part of 'favouriteplayers_bloc.dart';

@immutable
abstract class FavouriteplayersState {}

class FavouriteplayersInitial extends FavouriteplayersState {}

class LoadingPlayerSearchPage extends FavouriteplayersState {}

class OpenPlayerSearchPage extends FavouriteplayersState {}

class AddPlayer extends FavouriteplayersState {
  final List<PlayerModel> favouritPlayers;

  AddPlayer({required this.favouritPlayers});
}
