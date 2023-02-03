import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:my_music/Storage.dart';
import "Widgets/Songs.dart";
import 'dart:developer';

bool isPlaying = false;
bool shuffle = false;
bool repeat = false;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Storage s = Storage();
  AudioPlayer player = AudioPlayer();
  String currentSong = " ";

  void Change(PointerEvent details) async {
    player.onPlayerStateChanged.listen((PlayerState p) => {
          if (p == PlayerState.playing)
            {
              currentSong = s.getName(s.getFiles()[s.getPos()]),
              setState(() {
                isPlaying = true;
              })
            }
          else if (p == PlayerState.paused || p == PlayerState.stopped)
            {
              setState(() {
                isPlaying = false;
              })
            }
          else
            {
              //TODO shuffle e Repeat
              if (repeat)
                {
                  player.play(AssetSource(s.getFiles()[s.getPos()])),
                }
              else if (shuffle)
                {
                  s.jumpTo(Random().nextInt(s.getFiles().length)),
                  player.play(AssetSource(s.getFiles()[s.getPos()])),
                }
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "My Music",
        ),
      ),
      body: Listener(
        onPointerDown: Change,
        child: Songs(
          storage: s,
          player: player,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 30, top: 20),
              child: Text(currentSong),
            ),
            //Second Row (goBack , play/pause , Skip)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () async {
                    player.play(AssetSource(s.goBack()));
                  },
                  tooltip: 'skipPrevious',
                  child: const Icon(Icons.skip_previous),
                ),
                isPlaying
                    ? FloatingActionButton(
                        onPressed: () =>
                            {player.pause(), setState(() => isPlaying = false)},
                        tooltip: 'pause',
                        child: const Icon(Icons.pause))
                    : FloatingActionButton(
                        onPressed: () =>
                            {player.resume(), setState(() => isPlaying = true)},
                        tooltip: 'pause',
                        child: const Icon(Icons.play_arrow),
                      ),
                FloatingActionButton(
                  onPressed: () => {
                    player.play(AssetSource(s.SkipSong())),
                  },
                  tooltip: 'skipNext',
                  child: const Icon(Icons.skip_next),
                ),
              ],
            ),
            //third row (shuffle and repeat)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  mini: true,
                  onPressed: () {
                    setState(() {
                      shuffle = !shuffle;
                    });
                  },
                  tooltip: 'shuffle',
                  child: const Icon(Icons.shuffle),
                ),
                repeat
                    ? FloatingActionButton(
                        mini: true,
                        onPressed: () {
                          setState(() {
                            repeat = false;
                          });
                        },
                        tooltip: 'loop',
                        child: const Icon(Icons.repeat_one),
                      )
                    : FloatingActionButton(
                        mini: true,
                        onPressed: () {
                          setState(() {
                            repeat = true;
                          });
                        },
                        tooltip: 'loop',
                        child: const Icon(Icons.repeat),
                      ),
              ],
            )
          ],
        ),
      )),
    ));
  }
}
