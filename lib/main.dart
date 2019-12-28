import 'package:atom_reader/screens/feed_detail/feed_detail.dart';
import 'package:atom_reader/screens/feed_list/feed_list.dart';
import 'package:atom_reader/util/constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData.dark(),
      onGenerateRoute: _routes(),
      home: new Scaffold(
        appBar: new AppBar(
            title: new Text(Constants.APP_TITLE)
          ),
        body: new FeedList(),
      ),
    );
  }

  
  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case Constants.FeedListRoute:
          screen = FeedList();
          break;
        case Constants.FeedDetailRoute:
          screen = FeedDetail(item: arguments['data']); //{@code data} defined/passed in Navigator.pushNamed(...)
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}

