import 'package:atom_reader/util/constants.dart';
import 'package:webfeed/domain/atom_feed.dart';
import 'package:http/http.dart' as http;

class Util {
  getFeed() async {
    final response = await http.get(Constants.FEED_URL); // if not 'await', it will return Future<Obj>
    if(response.statusCode == 200){
      return AtomFeed.parse(response.body);
    } else {
      throw Exception("Unable to get data!");
    }
  }

// === UTIL methods ===
  static final Util _instance = Util._internal();
  factory Util() => _instance;

  //private constructor, _internal can be any name
  Util._internal(); 
}
