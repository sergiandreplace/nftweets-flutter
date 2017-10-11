import 'package:flutter/material.dart';


class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => new _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.amber,
      child: new Center(
        child: new Text("News"),
      ),
    );
  }
}
