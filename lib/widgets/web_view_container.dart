import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Should be Stateful, since there might be data update
/// On the generated code (tested on android), `minSdkVersion` shoudl be `20`
class WebViewContainer extends StatefulWidget {
  final content;

  WebViewContainer(this.content);

  @override
  _WebViewContainerState createState() => _WebViewContainerState(content);
}

class _WebViewContainerState extends State<WebViewContainer> {
  var _content;
  var _key = UniqueKey();

  _WebViewContainerState( this._content);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // Container(
        //   child: Text(_title),
        // ),
        Expanded(
          child: WebView(
            key: _key,
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: _content,
            onWebViewCreated: (controller) => _loadDataFromString(controller, _content),
          ),
        ),
      ],
    );
  }

  _loadDataFromString(WebViewController controller, String content) async {
    Uri uri = Uri.dataFromString(
                content,
                mimeType: 'text/html',
                encoding: Encoding.getByName('utf-8'),
              );
    controller.loadUrl(uri.toString());
  }
}
