import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // print(_feed);
    return new Container(
      child: StreamBuilder(
        stream: _feed,
        initialData: ,
      ),
    //   child: new ListView.builder(
    //       itemCount: _feed.items.length,
    //       itemBuilder: (BuildContext ctx, int index) => buildBody(context, index)),
    // );
  }

  Widget buildBody(BuildContext context, int itemIndex) {
    return new Card(
      child: Row(
        children: <Widget>[
            leftContianer, 
            getMiddleWidget(itemIndex)
          ],
      ),
    );
  }

  static final url = "https://1.bp.blogspot.com/-m8k8aQWLi_A/XP8X3Ua0hpI/AAAAAAAAK38/JZi8aqpQyM495F6wh0QFCb_uY5uMg1H6wCLcBGAs/s1600/800px-Memorial_JK.jpeg";
  final leftContianer = new Container(
                                padding: const EdgeInsets.all(16.0),
                                child: Image.network(url, height: 50.0, fit: BoxFit.fill)
                                );

  Widget getMiddleWidget(int itemIndex){
    return new Expanded(
                child: new Container(
                      padding: new EdgeInsets.only(left: 8.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new Text(_feed.items[itemIndex].title, textAlign: TextAlign.left),
                          new Text(_feed.items[itemIndex].updated, textAlign: TextAlign.left)
                        ],
                      ))
                    );
  }
}
