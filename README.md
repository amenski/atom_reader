## Atom Reader (Feed reader)
Atom Syndication/feed to list reader sample application. 

I worked on this project while studying flutter. *Flutter is Google's UI toolkit for crafting beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.*

## Userful links:
* https://fluttercrashcourse.com/
* https://flutter-academy.com/ and many more

### The project uses the following plugins/libraries:
* [webfeed](https://pub.dev/packages/webfeed) : A dart package for parsing RSS and Atom feed. 
* [http](https://pub.dev/packages/http) : A composable, Future-based library for making HTTP requests.
* [webview_flutter](https://pub.dev/packages/webview_flutter) : A Flutter plugin that provides a WebView widget.

### Note: 
I had a problem using `webview` for the detail page. The error said: "*Trying to create a platform view of unregistered type plugins.flutter.io/webview*". I managed to solve it by updating to `minSdkVersion 20`, rather flutter generates `minSdkVersion 16` as default.