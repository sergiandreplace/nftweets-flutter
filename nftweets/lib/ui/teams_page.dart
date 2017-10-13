import 'package:flutter/material.dart';

class TeamsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      new TabBarView(
        children: <Widget>[
          new Card(child: new Text("Teams")),
          new Card(child: new Text("Moar teams")),
        ],
      );
  }
}
