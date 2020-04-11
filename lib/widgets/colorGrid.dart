import 'package:flutter/material.dart';

class ColorGrid extends StatelessWidget {
  final int code;
  final String name;

  const ColorGrid({
    this.code,
    this.name,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: new Color(code),
      child: InkWell(
          onTap: () {
            print('tapped');
          },
          child: Center(
            child: Container(
              child: Text(
                name,
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
