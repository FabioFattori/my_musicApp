import 'dart:developer';

import 'dart:convert';
import 'package:http/http.dart' as http;

class Storage {
  List<String> toReturn = <String>[];
  int pos = 0;

  int getPos() {
    return pos;
  }

  incrementPos() {
    pos++;
  }

  decrementPos() {
    pos--;
  }

  jumpTo(n) {
    pos = n;
  }

  GivenAPathUpdatePos(path) {
    pos = toReturn.indexOf(path);
  }

  String SkipSong() {
    if (pos < toReturn.length - 1) {
      pos++;
      return toReturn[pos];
    }
    pos = 0;
    return toReturn[pos];
  }

  String getName(path) {
    String finalString = path.split(".mp3")[0];
    List<String> appoggio = finalString.split('_');
    finalString = "";
    for (var i = 0; i < appoggio.length; i++) {
      finalString += '${appoggio[i]} ';
    }

    return finalString;
  }

  String goBack() {
    if (pos > 0) {
      pos--;
      return toReturn[pos];
    }
    pos = toReturn.length - 1;
    return toReturn[pos];
  }

  setFiles() async {
    
    
    String path = "i'm_losing_my_mind.mp3";

    toReturn.add(path);

    path = "Gemitaiz_-_On_The_Corner_Prod_BassiMaestro.mp3";

    toReturn.add(path);
  }

  List<String> getFiles() {
    if (toReturn.isEmpty) {
      setFiles();
    }

    return toReturn;
  }
}
