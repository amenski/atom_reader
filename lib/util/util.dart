import 'package:atom_reader/util/constants.dart';
import 'package:webfeed/domain/atom_feed.dart';
import 'package:http/http.dart' as http;

class Util {
 var _sample = '<?xml version="1.0" encoding="utf-8"?><feed xmlns="http://www.w3.org/2005/Atom"><title>Example Feed</title><link href="http://example.org/"/><updated>2003-12-13T18:30:02Z</updated><author><name>John Doe</name></author><id>urn:uuid:60a76c80-d399-11d9-b93C-0003939e0af6</id><entry><title>Atom-Powered Robots Run Amok</title><link href="http://example.org/2003/12/13/atom03"/><id>urn:uuid:1225c695-cfb8-4ebb-aaaa-80da344efa6a</id><content>Sample content</content><published>2003-12-13T18:30:02Z</published><updated>2003-12-13T18:30:02Z</updated><summary>Some text.</summary></entry></feed>';

  /// UNCOMMENT THE FOLLOWING FOR REAL `http` CALL
  getFeed() async {
    // final response = await http.get(Constants.FEED_URL); // if not 'await', it will return Future<Obj>
    // if(response.statusCode == 200){
    //   return AtomFeed.parse(response.body);
    // } else {
    //   throw Exception("Unable to get data!");
    // }
    return AtomFeed.parse(_sample);
  }

// === UTIL methods ===
  static final Util _instance = Util._internal();
  factory Util() => _instance;

  //private constructor, _internal can be any name
  Util._internal(); 
}
