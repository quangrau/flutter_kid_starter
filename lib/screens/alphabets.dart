import 'dart:convert';
import 'dart:async' show Future;
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
  final Color _primaryColor = Colors.yellow[100];
  final Color _secondaryColor = Colors.pink[100];

  Future<List<AlphabetEntity>> _alphabetsFuture;
  FlutterSoundPlayer _soundPlayer;
  int _selectedIndex;

  @override
  void initState() {
    super.initState();

    _alphabetsFuture = _fetchAlphabets();
    _soundPlayer = new FlutterSoundPlayer();
  }

  // void _playAudio(String audioPath) async {
  //   // Load a local audio file and get it as a buffer
  //   Uint8List buffer = (await rootBundle.load(audioPath)).buffer.asUint8List();
  //   await _soundPlayer.startPlayerFromBuffer(buffer);
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BaseAppBar(
          title: 'ABC',
          primaryColor: _primaryColor,
          secondaryColor: _secondaryColor,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                _primaryColor,
                _secondaryColor,
              ],
            ),
          ),
          child: FutureBuilder(
            future: _alphabetsFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  padding: const EdgeInsets.all(20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
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
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _soundPlayer.release();
    super.dispose();
  }
}
