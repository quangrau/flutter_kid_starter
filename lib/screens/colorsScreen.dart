import 'package:flutter/material.dart';

class ColorsScreen extends StatelessWidget {
  final List<Color> _colors = [Colors.red[400], Colors.blue, Colors.green, Colors.yellow, ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[100],
        title: Text('Colors'),
      ),
      body: Container(
        child: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: _colors.map(
            (color) => ColorWidget(
              colorName: color.toString(),
              colorCode: color,
            )
          ).toList(),
        ),
      ),
    );
  }
}

class ColorWidget extends StatelessWidget {
  final String colorName;
  final Color colorCode;

  const ColorWidget({
    this.colorName,
    this.colorCode,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: colorCode,
      child: InkWell(
          onTap: () {
            print('tapped');
          },
          child: Center(
            child: Container(
              child: Text(
                colorName,
                style: TextStyle(
                  fontFamily: 'CabinSketch',
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
            ),
          )),
    );
  }
}
