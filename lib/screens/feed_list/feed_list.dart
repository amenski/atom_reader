import 'package:atom_reader/util/constants.dart';
import 'package:atom_reader/util/util.dart';
import 'package:flutter/material.dart';
import 'package:webfeed/domain/atom_feed.dart';
import 'package:webfeed/domain/atom_item.dart';

import 'package:intl/intl.dart';

class FeedList extends StatefulWidget {
  @override
  _FeedList createState() => _FeedList();
}

class _FeedList extends State<FeedList> {
  List<AtomItem> _atomItems;

  @override
  void initState() {
    super.initState();
    loadFeedData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  _populateContainer(),
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
    return GestureDetector(
      onTap: () => _navigateToDetail(context, index),
      child: ListTile(
        title: Text(_atomItems[index].title),
        subtitle: Text(new DateFormat()
            .add_yMd()
            .format(DateTime.parse(_atomItems[index].published))),
        leading: _renderThumbnail(index),
      ),
    );
  }

_navigateToDetail(BuildContext context, int index) {
    Navigator.pushNamed(context, Constants.FeedDetailRoute, arguments: {'data': _atomItems[index]});
}
  
  // Render leading as thumbnail
  _renderThumbnail(int index) {
    var thumbnail;
    if (_atomItems[index].media.thumbnails.isNotEmpty) {
      thumbnail = _atomItems[index].media.thumbnails[0].url;
    }

    return Container(
      constraints: BoxConstraints.expand(width: 50.0), //contraint width of the leading image/icon
      child: thumbnail != null
          ? Image.network(thumbnail)
          : Image.asset(Constants.DEFAULT_LEADING_IMAGE),
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
