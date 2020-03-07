part of 'player_bloc.dart';

@immutable
abstract class PlayerState {}

class PlayingState extends PlayerState {}

class PausedState extends PlayerState {}
