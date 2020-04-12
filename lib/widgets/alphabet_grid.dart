import 'dart:math';
import 'package:flutter/material.dart';

class AlphabetGrid extends StatefulWidget {
  final bool selected;
  final String text;
  final VoidCallback onTap;

  const AlphabetGrid({
    this.text,
    this.onTap,
    this.selected,
    Key key,
  }) : super(key: key);

  @override
  _AlphabetGridState createState() => _AlphabetGridState();
}

class _AlphabetGridState extends State<AlphabetGrid> {
  final Color _randomColor = Colors
      .primaries[Random().nextInt(Colors.primaries.length)]
      .withOpacity(0.4);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        color: _randomColor,
        child: InkWell(
          onTap: widget.onTap,
          child: Center(
            child: Container(
              child: AnimatedDefaultTextStyle(
                style: widget.selected
                    ? const TextStyle(fontSize: 192)
                    : const TextStyle(fontSize: 128),
                duration: const Duration(milliseconds: 400),
                curve: Curves.bounceOut,
                child: Text(
                  widget.text,
                  style: const TextStyle(
                    fontFamily: 'CabinSketch',
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
