import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class FeedReaderBloc {
  // final _feed_url = "https://www.becompany.ch/en/blog/feed.xml";
  final _feedUrl = "http://www.danielkibret.com/feeds/posts/default";
  final streamController = StreamController();

  void updateData() {
    streamController.sink
        .add(http.read(_feedUrl).then((feed) => AtomFeed.parse(feed)));
  }
  
  void dispose() {
    streamController.close();
  }
}
