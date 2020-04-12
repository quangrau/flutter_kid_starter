import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _CategoryTile(
            title: 'Colors',
            route: '/colors',
            color: Colors.teal[100],
          ),
          _CategoryTile(
            title: '123',
            route: '/counting',
            color: Colors.pink[100],
          ),
          _CategoryTile(
            title: 'ABC',
            route: '/abc',
            color: Colors.yellow[100],
          ),
          _CategoryTile(
            title: 'Shapes',
            route: '/shapes',
            color: Colors.green[100],
          ),
          _CategoryTile(
            title: 'Stories',
            route: '/stories',
            color: Colors.blue[100],
          ),
        ],
      ),
    );
  }
}

class _CategoryTile extends StatelessWidget {
  final String title;
  final String route;
  final Color color;

  _CategoryTile({
    Key key,
    @required this.title,
    @required this.color,
    this.route,
  }) : super(key: key);

  void _navigate(BuildContext context, String route) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }

    Navigator.of(context).pushNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    return Material(
      color: color,
      child: InkWell(
        onTap: () {
          _navigate(context, this.route);
        },
        child: Container(
          height: 220.0,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 92.0,
                fontFamily: 'CabinSketch',
                fontWeight: FontWeight.w700,
                letterSpacing: 10.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
