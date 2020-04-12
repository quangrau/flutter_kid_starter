import 'package:flutter/material.dart';
import 'package:flutterkutkit/screens/alphabets.dart';
import 'package:flutterkutkit/screens/colors.dart';
import 'package:flutterkutkit/screens/counting.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _CategoryTile(
            title: 'Colors',
            screen: ColorsScreen(),
            color: Colors.teal[100],
          ),
          _CategoryTile(
            title: '123',
            screen: CountingScreen(),
            color: Colors.pink[100],
          ),
          _CategoryTile(
            title: 'ABC',
            screen: AlphabetsScreen(),
            color: Colors.yellow[100],
          ),
          _CategoryTile(
            title: 'Shapes',
            screen: AlphabetsScreen(),
            color: Colors.green[100],
          ),
          _CategoryTile(
            title: 'Stories',
            screen: AlphabetsScreen(),
            color: Colors.blue[100],
          ),
        ],
      ),
    );
  }
}

class _CategoryTile extends StatelessWidget {
  final String title;
  final Widget screen;
  final Color color;

  _CategoryTile({
    Key key,
    @required this.title,
    @required this.color,
    @required this.screen,
  }) : super(key: key);

  void _navigate(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return screen;
    }));
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    return SafeArea(
      child: Material(
        color: color,
        child: InkWell(
          onTap: () {
            _navigate(context, this.screen);
          },
          child: Container(
            alignment: Alignment.center,
            height: 220.0,
            child: Hero(
              tag: "page_$title",
              child: Material(
                type: MaterialType.transparency,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 92.0,
                    fontFamily: 'CabinSketch',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 10.0,
                  ),
                  softWrap: false,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
