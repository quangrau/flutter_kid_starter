import 'dart:math';
import 'package:flutter/material.dart';

Color getRandomColor({double opacity = 0.8}) {
  return Colors.primaries[Random().nextInt(Colors.primaries.length)]
      .withOpacity(opacity);
}

Color getIndexColor(int index, {double opacity = 0.8}) {
  return Colors.primaries[index % Colors.primaries.length].withOpacity(opacity);
}
