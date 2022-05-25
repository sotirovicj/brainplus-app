import 'package:app/models/photo.dart';
import 'package:app/models/topic.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Topic>> getTopics() async {
    var client = http.Client();
    var uri = Uri.parse('https://brainplus-api.herokuapp.com/topics');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return topicFromJson(json);
    }
    throw 'Something went wrong!';
  }

  Future<List<Photo>> getPhotos(topicId) async {
    var client = http.Client();
    var uri =
        Uri.parse('https://brainplus-api.herokuapp.com/topics/$topicId/images');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return photoFromJson(json);
    }
    throw 'Something went wrong!';
  }

  Future<String> incrementCounter(String counterId) async {
    var client = http.Client();
    var uri =
        Uri.parse('https://brainplus-api.herokuapp.com/counters/$counterId');
    var response = await client.post(
      uri,
    );
    if (response.statusCode == 200) {
      return 'OK';
    } else {
      throw 'Something went wrong!';
    }
  }
}
