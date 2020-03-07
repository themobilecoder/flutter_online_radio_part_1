part of 'player_bloc.dart';

@immutable
abstract class PlayerEvent {}

class PlayEvent extends PlayerEvent {}

class PauseEvent extends PlayerEvent {}
