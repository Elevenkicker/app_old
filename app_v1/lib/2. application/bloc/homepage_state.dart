part of 'homepage_bloc.dart';

@immutable
abstract class HomepageState {}

class HomepageInitial extends HomepageState {}

class HomepagePlayerSearchLoading extends HomepageState {}

class HomepagePlayerSearchLoaded extends HomepageState {}

class HomepageError extends HomepageState {}
