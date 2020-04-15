import 'package:flutter/material.dart';
import 'package:flutterkutkit/screens/alphabets.dart';
import 'package:flutterkutkit/screens/colors.dart';
import 'package:flutterkutkit/screens/counting.dart';
import 'package:flutterkutkit/screens/shapes.dart';
import 'package:flutterkutkit/screens/stories.dart';
import 'package:flutterkutkit/widgets/category_card.dart';

class HomeScreen extends StatelessWidget {
  final List<Widget> _categories = [
    CategoryCard(
      title: 'Colors',
      primaryColor: Colors.orangeAccent[100],
      secondaryColor: Colors.orange,
      screen: ColorsScreen(
        title: 'Colors',
        primaryColor: Colors.orangeAccent[100],
        secondaryColor: Colors.orange,
      ),
    ),
    CategoryCard(
      title: '123',
      primaryColor: Colors.greenAccent[100],
      secondaryColor: Colors.green,
      screen: CountingScreen(
        title: '123',
        primaryColor: Colors.greenAccent[100],
        secondaryColor: Colors.green,
      ),
    ),
    CategoryCard(
      title: 'ABC',
      primaryColor: Colors.purpleAccent[100],
      secondaryColor: Colors.purple,
      screen: AlphabetsScreen(
        title: 'ABC',
        primaryColor: Colors.purpleAccent[100],
        secondaryColor: Colors.purple,
      ),
    ),
    CategoryCard(
      title: 'Stories',
      primaryColor: Color(0xFF3383CD),
      secondaryColor: Color(0xFF11249F),
      screen: StoriesScreen(
        title: 'Stories',
        primaryColor: Color(0xFF3383CD),
        secondaryColor: Color(0xFF11249F),
      ),
    ),
    CategoryCard(
      title: 'Shapes',
      primaryColor: Colors.redAccent[100],
      secondaryColor: Colors.red,
      screen: ShapesScreen(
        title: 'Shapes',
        primaryColor: Colors.redAccent[100],
        secondaryColor: Colors.red,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.grey[50],
        decoration: BoxDecoration(
          color: Colors.grey[50],
          image: DecorationImage(
            image: AssetImage('assets/images/bg-bottom.png'),
            alignment: Alignment.bottomCenter,
          ),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 220.0,
              backgroundColor: Colors.grey[50],
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/bg-top.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(_categories),
            ),
          ],
        ),
      ),
    );
  }
}
