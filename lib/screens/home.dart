import 'package:atom_reader/util/util.dart';
import 'package:flutter/material.dart';
import 'package:webfeed/domain/atom_feed.dart';
import 'package:webfeed/domain/atom_item.dart';

import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<AtomItem> _atomItems;

  @override
  void initState() {
    super.initState();
    loadFeedData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _populateContainer(),
    );
  }

  Widget _populateContainer() {
    if (_atomItems == null) {
      return Container(
        child: Text("No data has been found."),
      );
    }

    return ListView.builder(
      itemCount: _atomItems.length,
      itemBuilder: (context, index) => _buildBody(context, index),
    );
  }

  _buildBody(BuildContext context, int index) {
    var thumbnail;
    var thumbnailAsset = 'assets/images/default.jpg';

    if (_atomItems[index].media.thumbnails.isNotEmpty) {
      thumbnail = _atomItems[index].media.thumbnails[0].url;
    }
    return Container(
      child: ListTile(
        title: Text(_atomItems[index].title),
        subtitle: Text(new DateFormat().add_yMd().format(DateTime.parse(_atomItems[index].published))),
        leading: thumbnail != null ? Image.network(thumbnail) : Image.asset(thumbnailAsset),
      ),
    );
  }

  loadFeedData() async {
    Util util = Util();
    AtomFeed data = await util.getFeed();
    setState(() {
      // Notify internal change has occured, so as it refreshes
      this._atomItems = data.items;
    });
  }
}
