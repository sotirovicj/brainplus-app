import 'package:app/models/photo.dart';
import 'package:app/models/topic.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Topic>> getTopics() async {
    var client = http.Client();
    // var uri = Uri.parse('https://brainplus-api.herokuapp.com/topics');
    var uri = Uri.parse('http://localhost:3000/topics');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return topicFromJson(json);
    }
    throw ''; // TODO
  }

  Future<List<Photo>> getPhotos(topicId) async {
    var client = http.Client();
    var uri = Uri.parse('http://localhost:3000/topics/$topicId/images');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return photoFromJson(json);
    }
    throw ''; // TODO
  }

  // TODO add register click
}
