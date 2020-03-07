import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:online_radio/radio/radio_player.dart';

class JustAudioPlayer extends RadioPlayer {
  final audioPlayer = AudioPlayer();

  @override
  Future<void> pause() {
    return audioPlayer.pause();
  }

  @override
  Future<void> play({@required String url}) async {
    await audioPlayer.setUrl(url);
    return audioPlayer.play();
  }
}
