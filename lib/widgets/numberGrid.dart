import 'dart:math';

import 'package:flutter/material.dart';

class NumberGrid extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const NumberGrid({
    this.text,
    this.onTap,
    Key key,
  }) : super(key: key);

  @override
  _NumberGridState createState() => _NumberGridState();
}

class _NumberGridState extends State<NumberGrid> {
  bool _isTapped = false;
  Color _background = Colors
      .primaries[Random().nextInt(Colors.primaries.length)]
      .withOpacity(0.4);

  void _handleTap() {
    setState(() {
      _isTapped = true;
    });

    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Material(
        color: _background,
        child: InkWell(
            onTap: _handleTap,
            child: Center(
              child: Container(
                child: AnimatedDefaultTextStyle(
                  style: _isTapped
                      ? TextStyle(fontSize: 128)
                      : TextStyle(fontSize: 64),
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.bounceOut,
                  child: Text(
                    widget.text,
                    style: TextStyle(
                      fontFamily: 'CabinSketch',
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
