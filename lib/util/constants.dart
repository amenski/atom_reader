
/// Holds constants used in the app, enum's are ommited for the sake of compatibility with earlier version of 
/// dart (< 2.6), since ``extension`` on dart is added in version > 2.6
class Constants {
  static const APP_TITLE = 'Feed List';

  static const String DEFAULT_LEADING_IMAGE = 'assets/images/default.jpg';

  static const FEED_URL = "https://flutter-academy.com/rss.xml";


   /// Routes in our app
  static const FeedListRoute = '/';
  static const FeedDetailRoute = '/feed-detail';

  // Instantiation is not allowed
  Constants._privateConstructor();
  factory Constants() => null; 
}