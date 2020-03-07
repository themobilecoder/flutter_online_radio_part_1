import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:online_radio/radio/radio_player.dart';

part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final RadioPlayer radioPlayer;

  PlayerBloc({@required this.radioPlayer}) : assert(radioPlayer != null);

  @override
  PlayerState get initialState => PausedState();

  @override
  Stream<PlayerState> mapEventToState(
    PlayerEvent event,
  ) async* {
    if (event is PlayEvent && state is! PlayingState) {
      radioPlayer.play(url: event.url);
      yield PlayingState();
    } else if (event is PauseEvent) {
      radioPlayer.pause();
      yield PausedState();
    }
  }
}
