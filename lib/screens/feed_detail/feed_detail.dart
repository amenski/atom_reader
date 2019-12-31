import 'dart:developer';

import 'package:atom_reader/widgets/web_view_container.dart';
import 'package:flutter/material.dart';
import 'package:webfeed/domain/atom_item.dart';

class FeedDetail extends StatelessWidget {
  final AtomItem item;

  FeedDetail({@required this.item});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData.dark(),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(item.title),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () => log("on tap pressed"),
            )
          ],
        ),
        body: SafeArea(
          // SafeArea: prevents content from going under notch, the small cutout on top of the phone
          child: WebViewContainer(item.content),
        ),
      ),
    );
  }
}
