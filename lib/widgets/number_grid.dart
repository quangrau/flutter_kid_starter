import 'dart:math';

import 'package:flutter/material.dart';

class NumberGrid extends StatefulWidget {
  final bool selected;
  final String text;
  final VoidCallback onTap;

  const NumberGrid({
    this.selected,
    this.text,
    this.onTap,
    Key key,
  }) : super(key: key);

  @override
  _NumberGridState createState() => _NumberGridState();
}

class _NumberGridState extends State<NumberGrid> {
  Color _randomColor = Colors
      .primaries[Random().nextInt(Colors.primaries.length)]
      .withOpacity(0.4);

  void _handleTap() {
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        color: _randomColor,
        child: InkWell(
          onTap: _handleTap,
          child: Container(
            alignment: Alignment.center,
            child: AnimatedDefaultTextStyle(
              style: widget.selected
                  ? const TextStyle(fontSize: 192)
                  : const TextStyle(fontSize: 128),
              duration: const Duration(milliseconds: 400),
              curve: Curves.bounceOut,
              child: Text(
                widget.text,
                softWrap: false,
                style: TextStyle(
                  fontFamily: 'CabinSketch',
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
