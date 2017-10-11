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

  final _duration = kThemeAnimationDuration;

  int _currentPage = 0;

  AnimationController _newsController;
  AnimationController _teamsController;
  CurvedAnimation _teamsAnimation;
  CurvedAnimation _newsAnimation;
  FadeTransition _teamsTransition;
  FadeTransition _newsTransition;

  HomePageState() {
    _newsController = new AnimationController(
      duration: _duration,
      vsync: this,
    );
    _teamsController = new AnimationController(
      duration: _duration,
      vsync: this,
      value: 1.0
    );
    _teamsAnimation = new CurvedAnimation(
      parent: _teamsController,
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeInOut
    );
    _newsAnimation = new CurvedAnimation(
      parent: _newsController,
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeInOut

    );
    _teamsTransition = new FadeTransition(
      opacity: _teamsAnimation,
      child: new TeamsPage(),
    );
    _newsTransition= new FadeTransition(
    opacity: _newsAnimation,
    child: new NewsPage(),
    );
  }




   _setPage (int newPage) {
     _currentPage = newPage;
     setState(()  {
      if (_currentPage == 0) {
        _newsController.reverse();
        _teamsController.forward();
      } else if (_currentPage == 1) {
        _teamsController.reverse();
        _newsController.forward();
      }
    });
  }

  Widget _getCurrentPage() {


    if (_currentPage == 0) {
      return new Stack(
        children: <Widget>[
          _teamsTransition,
          _newsTransition,
        ],
      );
    }else {
      return new Stack(
        children: <Widget>[
          _newsTransition,
          _teamsTransition,
        ],
      );
    }
  }

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
      onTap: (value) => _setPage(value),
    );


    return new Scaffold(
      appBar: new AppBar(
        title: new Container(
          padding: new EdgeInsets.only(left: 8.0),
          child: new Text("NFTweets"),
        ),
      ),
      body: _getCurrentPage(),
      bottomNavigationBar: _bottomBar,

    );
  }
}

