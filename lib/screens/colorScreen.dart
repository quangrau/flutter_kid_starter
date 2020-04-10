import 'package:flutter/material.dart';

class ColorsScreen extends StatelessWidget {
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
          children: <Widget>[
            ColorWidget(color: 'Red'),
            ColorWidget(color: 'Green'),
            ColorWidget(color: 'Blue'),
          ],
        ),
      ),
    );
  }

  List _buildList(int count) {
    List<Widget> listItems = List();

    for (int i = 0; i < count; i++) {
      listItems.add(new Padding(
          padding: new EdgeInsets.all(20.0),
          child: new Text('Item ${i.toString()}',
              style: new TextStyle(fontSize: 25.0))));
    }

    return listItems;
  }
}

class ColorWidget extends StatelessWidget {
  final String color;

  const ColorWidget({
    this.color,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.red[400],
      child: InkWell(
          onTap: () {
            print('tapped');
          },
          child: Center(
            child: Container(
              child: Text(
                color,
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
