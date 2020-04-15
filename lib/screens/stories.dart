import 'package:flutter/material.dart';
import 'package:flutterkutkit/widgets/page_header.dart';

class StoriesScreen extends StatelessWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;

  const StoriesScreen({
    this.title,
    this.primaryColor,
    this.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          PageHeader(
            title: title,
            primaryColor: primaryColor,
            secondaryColor: secondaryColor,
          ),
          Container(
            alignment: Alignment.center,
            child: Text('Comming soon...'),
          ),
        ],
      ),
    );
  }
}
