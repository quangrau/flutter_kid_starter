import 'package:flutter/material.dart';
import 'package:flutterkutkit/constant.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;
  final Widget screen;

  CategoryCard({
    Key key,
    @required this.title,
    @required this.primaryColor,
    @required this.secondaryColor,
    @required this.screen,
  }) : super(key: key);

  void _navigate(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return screen;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 10,
            color: kActiveShadowColor,
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            primaryColor,
            secondaryColor,
          ],
        ),
      ),
      height: 180.0,
      child: Material(
        type: MaterialType.transparency,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          onTap: () {
            _navigate(context, screen);
          },
          child: Container(
            alignment: Alignment.center,
            child: Text(
              title,
              style: kHeadingTextStyle.copyWith(
                fontSize: 90.0,
                letterSpacing: 4.0,
              ),
              softWrap: false,
            ),
          ),
        ),
      ),
    );
  }
}
