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
            color: Colors.grey[900].withOpacity(0.2),
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
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
            _navigate(context, screen);
          },
          child: Container(
            alignment: Alignment.center,
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(20.0),
            ),
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
