import 'dart:convert';
import 'dart:async' show Future;
// import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_sound/flutter_sound_player.dart';
import 'package:flutterkutkit/entities/alphabet.dart';
import 'package:flutterkutkit/widgets/alphabet_grid.dart';
import 'package:flutterkutkit/widgets/base_app_bar.dart';

Future<List<AlphabetEntity>> _fetchAlphabets() async {
  String jsonString = await rootBundle.loadString('assets/data/alphabets.json');
  final jsonParsed = json.decode(jsonString);

  return jsonParsed
      .map<AlphabetEntity>((json) => new AlphabetEntity.fromJson(json))
      .toList();
}

class AlphabetsScreen extends StatefulWidget {
  AlphabetsScreen();

  @override
  _AlphabetsScreenState createState() => _AlphabetsScreenState();
}

class _AlphabetsScreenState extends State<AlphabetsScreen> {
  Future<List<AlphabetEntity>> _alpabetsFuture;
  FlutterSoundPlayer _soundPlayer;
  int _selectedIndex;

  @override
  void initState() {
    super.initState();

    _alpabetsFuture = _fetchAlphabets();
    _soundPlayer = new FlutterSoundPlayer();
  }

  // void _playAudio(String audioPath) async {
  //   // Load a local audio file and get it as a buffer
  //   Uint8List buffer = (await rootBundle.load(audioPath)).buffer.asUint8List();
  //   await _soundPlayer.startPlayerFromBuffer(buffer);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          title: 'ABC',
          backgroundColor: Colors.yellow[100],
        ),
        body: FutureBuilder(
          future: _alpabetsFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return AlphabetGrid(
                    selected: _selectedIndex == index,
                    text: snapshot.data[index].text,
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                      // _playAudio(snapshot.data[index].audio);
                    },
                  );
                },
              );
            } else {
              return Center(
                child: Text('Loading...'),
              );
            }
          },
        ));
  }

  @override
  void dispose() {
    _soundPlayer.release();
    super.dispose();
  }
}