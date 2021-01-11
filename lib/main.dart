import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final List<MaterialColor> keyColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.purple,
    Colors.pink
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buildKeys(
              list: new List(keyColors.length),
              colors: keyColors,
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildKeys({List<Widget> list, List<MaterialColor> colors}) {
    // build the List<Widget> list of Expanded() widgets
    for (var i = 0; i <= list.length - 1; i++) {
      list[i] = Expanded(
        child: FlatButton(
          color: colors[i],
          onPressed: () {
            playSound(i + 1);
          },
          child: Text(''),
        ),
      );
    }
    return list;
  }

  void playSound(int noteNum) {
    final player = AudioCache();
    player.play('note$noteNum.wav');
  }
}
