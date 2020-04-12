import 'package:flutter/material.dart';

class ColorGrid extends StatelessWidget {
  final int code;
  final String name;
  final VoidCallback onTap;

  const ColorGrid({
    this.code,
    this.name,
    this.onTap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
          child: Material(
        color: new Color(code),
        child: InkWell(
            onTap: onTap,
            child: Center(
              child: Container(
                child: Text(
                  name,
                  style: TextStyle(
                    fontFamily: 'CabinSketch',
                    fontSize: 54,
                    fontWeight: FontWeight.w700,
                    color: name == 'White' || name == 'Yellow'
                        ? Colors.black.withOpacity(0.4)
                        : Colors.white.withOpacity(0.65),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
