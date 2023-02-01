import 'package:flutter/material.dart';
import "btn.dart";

class Songs extends StatefulWidget {
  Songs({super.key, required this.storage, required this.player});
  final player;
  final storage;

  @override
  State<Songs> createState() => _SongsState();
}

class _SongsState extends State<Songs> {
  late List<String> files;

  @override
  void initState() {
    super.initState();
    files = widget.storage.getFiles();
  }

  Widget _buildRow(int i) {
    return ListTile(
      title: btn(
        path: files[i],
        player: widget.player,
        store:widget.storage,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount:files.length,
        itemBuilder: (BuildContext context, int position) {
          return _buildRow(position);
        }));
  }
}
