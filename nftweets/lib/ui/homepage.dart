import 'package:flutter/material.dart';
import 'package:nftweets/ui/news_page.dart';
import 'package:nftweets/ui/teams_page.dart';

class HomePage extends StatefulWidget {

  @override
  State createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final _bottomBar = new BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
          icon: new Icon(Icons.format_list_bulleted), title: new Text("Teams"),
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.assignment), title: new Text("News")),
      ],
      currentIndex: _currentPage,
      onTap: (value) => setState(() => _currentPage = value),
    );

   final _tabBar = new TabBar(
      isScrollable: false,
      tabs: <Widget>[
        new Tab(text: "Teams"),
        new Tab(text: "Moar teams"),
      ],
    );


    return new DefaultTabController(
      length: 2,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Container(
            padding: new EdgeInsets.only(left: 16.0),
            child: new Text("NFTweets"),
          ),
          bottom: _currentPage == 0 ? _tabBar : null,
        ),
        body: _currentPage == 0 ? new TeamsPage() : new NewsPage(),
        bottomNavigationBar: _bottomBar,
      ),
    );
  }
}

