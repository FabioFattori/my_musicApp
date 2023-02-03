import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:my_music/main.dart';

class btn extends StatefulWidget {
  btn(
      {super.key,
      required this.path,
      required this.player,
      required this.store});
  final String path;
  final player;
  final store;

  @override
  State<btn> createState() => _btnState();
}

class _btnState extends State<btn> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        widget.player.play(AssetSource(widget.path));
        widget.store.GivenAPathUpdatePos(widget.path);
        setState(() {
          isPlaying = true;
        });
      },

      //padding: const EdgeInsets.only(right: 13.0),
      child: Text(
        widget.store.getName(widget.store.getName(widget.path)),
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 15.5),
        textAlign: TextAlign.start,
      ),
    );
  }
}
