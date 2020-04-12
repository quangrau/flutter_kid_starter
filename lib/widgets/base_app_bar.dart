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
      color: backgroundColor,
      height: _preferredHeight,
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 20.0),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(16.0),
            child: ClipOval(
              child: Material(
                child: InkWell(
                  splashColor: Colors.pink[100], // inkwell color
                  child: SizedBox(
                    width: 56,
                    height: 56,
                    child: Image.asset(
                      'assets/icons/castle.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  onTap: () {
                    if (Navigator.of(context).canPop()) {
                      Navigator.of(context).pop();
                    }

                    Navigator.of(context).pushNamed('/');
                  },
                ),
              ),
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 42,
              fontFamily: 'CabinSketch',
              fontWeight: FontWeight.w700,
              letterSpacing: 2.0,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(_preferredHeight);
}
