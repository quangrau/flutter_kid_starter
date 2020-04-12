import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double _preferredHeight = 120.0;
  final String title;
  final Color backgroundColor;

  const BaseAppBar({
    this.title,
    this.backgroundColor,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _preferredHeight,
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            backgroundColor,
            Colors.teal[100],
          ],
        ),
      ),
      child: Row(
//        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 64,
            height: 64,
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 21, // soften the shadow
                  spreadRadius: -15, //end the shadow
                  offset: Offset(
                    0.0, // Move to right 10  horizontally
                    20.0, // Move to bottom 10 Vertically
                  ),
                )
              ],
            ),
            child: RaisedButton(
              child: Text('<', style: TextStyle(
                fontFamily: 'CabinSketch',
                fontWeight: FontWeight.w700,
                fontSize: 84,
              ),),
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 42,
              fontWeight: FontWeight.w700,
              fontFamily: 'CabinSketch',
              letterSpacing: 10.0,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(_preferredHeight);
}
