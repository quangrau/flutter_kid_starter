import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutterkutkit/entities/color.dart';
import 'package:flutterkutkit/widgets/colorGrid.dart';

Future<List<ColorEntity>> _fetchColors() async {
  String jsonString = await rootBundle.loadString('assets/data/colors.json');
  final jsonParsed = json.decode(jsonString);

  return jsonParsed
      .map<ColorEntity>((json) => new ColorEntity.fromJson(json))
      .toList();
}

class ColorsScreenState extends State<ColorsScreen> {
  Future<List<ColorEntity>> _colorsFuture;

  @override
  void initState() {
    _colorsFuture = _fetchColors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal[100],
          title: Text('Colors'),
        ),
        body: new FutureBuilder(
          future: _colorsFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ColorGrid(
                      code: int.parse(snapshot.data[index].colorCode),
                      // code: 0xffe91e63,
                      name: snapshot.data[index].colorName);
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
}

class ColorsScreen extends StatefulWidget {
  ColorsScreen();
  @override
  ColorsScreenState createState() => ColorsScreenState();
}
