import 'package:flutter/material.dart';

abstract class RadioPlayer {
  Future<void> play({@required String url});
  Future<void> pause();
}
