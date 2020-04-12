import 'dart:math';
import 'package:flutter/material.dart';

class AlphabetGrid extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Card(
      child: Material(
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)]
            .withOpacity(0.4),
        child: InkWell(
            onTap: onTap,
            child: Center(
              child: Container(
                child: AnimatedDefaultTextStyle(
                  style: selected
                      ? TextStyle(fontSize: 228)
                      : TextStyle(fontSize: 128),
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.bounceOut,
                  child: Text(
                    text,
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
