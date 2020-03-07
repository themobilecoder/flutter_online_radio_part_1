import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_radio/player_bloc/player_bloc.dart';

class HomeScreen extends StatelessWidget {
  final _planetRockUrl = 'https://stream-mz.planetradio.co.uk/planetrock.mp3';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Online Radio'),
      ),
      bottomSheet: Container(
        color: Theme.of(context).primaryColor,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 50,
                width: 50,
                child: Image.asset('assets/images/planet_rock.png'),
              ),
            ),
            Text(
              'Planet Rock',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: BlocBuilder<PlayerBloc, PlayerState>(
                bloc: BlocProvider.of<PlayerBloc>(context),
                builder: (context, state) {
                  if (state is PausedState) {
                    return IconButton(
                      icon: Icon(
                        Icons.play_arrow,
                        size: 32,
                      ),
                      onPressed: () {
                        context.bloc<PlayerBloc>().add(PlayEvent(url: _planetRockUrl));
                      },
                    );
                  } else {
                    return IconButton(
                      icon: Icon(
                        Icons.pause,
                        size: 32,
                      ),
                      onPressed: () {
                        context.bloc<PlayerBloc>().add(PauseEvent());
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[],
      ),
    );
  }
}
