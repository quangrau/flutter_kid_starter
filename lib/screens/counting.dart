import 'dart:convert';
import 'dart:async' show Future;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_sound/flutter_sound_player.dart';
import 'package:flutterkutkit/entities/number.dart';
import 'package:flutterkutkit/helper.dart';
import 'package:flutterkutkit/widgets/page_header.dart';
import 'package:flutterkutkit/widgets/tile_card.dart';

Future<List<NumberEntity>> _fetchNumbers() async {
  String jsonString = await rootBundle.loadString('assets/data/numbers.json');
  final jsonParsed = json.decode(jsonString);

  return jsonParsed
      .map<NumberEntity>((json) => new NumberEntity.fromJson(json))
      .toList();
}

class CountingScreen extends StatefulWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;

  CountingScreen({
    this.title,
    this.primaryColor,
    this.secondaryColor,
  });

  @override
  _CountingScreenState createState() => _CountingScreenState();
}

class _CountingScreenState extends State<CountingScreen> {
  Future<List<NumberEntity>> _numbersFuture;
  FlutterSoundPlayer _soundPlayer;
  int _selectedIndex;

  @override
  void initState() {
    super.initState();

    _numbersFuture = _fetchNumbers();
    _soundPlayer = new FlutterSoundPlayer();
  }

  void _playAudio(String audioPath) async {
    // Load a local audio file and get it as a buffer
    Uint8List buffer = (await rootBundle.load(audioPath)).buffer.asUint8List();
    await _soundPlayer.startPlayerFromBuffer(buffer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          PageHeader(
            title: widget.title,
            primaryColor: widget.primaryColor,
            secondaryColor: widget.secondaryColor,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: FutureBuilder(
                future: _numbersFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return TileCard(
                            isActive: _selectedIndex == index,
                            title: snapshot.data[index].text,
                            textColor: getIndexColor(index),
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                              _playAudio(snapshot.data[index].audio);
                            },
                          );
                        },
                      ),
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
        ],
      ),
    );
  }

  @override
  void dispose() {
    _soundPlayer.release();
    super.dispose();
  }
}
