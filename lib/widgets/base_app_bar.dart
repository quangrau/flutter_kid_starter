import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double _preferredHeight = 100.0;
  final String title;
  final Color primaryColor;
  final Color secondaryColor;

  const BaseAppBar({
    this.title,
    this.primaryColor,
    this.secondaryColor,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            primaryColor,
            secondaryColor,
          ],
        ),
      ),
      height: _preferredHeight,
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: ClipOval(
              child: Material(
                child: InkWell(
                  splashColor: Colors.pink[100], // inkwell color
                    child: Image.asset(
                      'assets/icons/castle.png',
                      fit: BoxFit.cover,
                    ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
          Hero(
            tag: "page_$title",
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 42,
                    fontFamily: 'CabinSketch',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(_preferredHeight);
}
