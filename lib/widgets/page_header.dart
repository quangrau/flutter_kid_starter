import 'package:flutterkutkit/constant.dart';
import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;

  const PageHeader({
    Key key,
    this.title,
    this.primaryColor,
    this.secondaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 40, top: 50, right: 40),
        height: 350,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              primaryColor,
              secondaryColor,
            ],
          ),
          image: DecorationImage(
            image: AssetImage("assets/images/bg-stars.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  '<<',
                  style: TextStyle(
                      fontSize: 42,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 160,
                    alignment: Alignment.center,
                    child: Text(
                      "$title",
                      style: kHeadingTextStyle,
                    ),
                  ),
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
