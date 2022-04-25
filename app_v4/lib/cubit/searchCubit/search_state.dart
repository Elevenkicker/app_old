part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  SearchLoaded({
    required this.regionsList,
  });

  final List<Region> regionsList;
}
