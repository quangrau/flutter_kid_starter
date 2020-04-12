import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double _prefferedHeight = 64.0;

  final String title;
  final Color backgroundColor;

  const BaseAppBar({
    this.title,
    this.backgroundColor,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 32,
          fontWeight: FontWeight.w700,
          fontFamily: 'CabinSketch',
          letterSpacing: 10.0,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(_prefferedHeight);
}
