import 'package:app/models/topic.dart';
import 'package:flutter/material.dart';

import '../models/photo.dart';
import '../services/remote_services.dart';

class TopicPage extends StatefulWidget {
  final Topic topic;
  const TopicPage({Key? key, required this.topic}) : super(key: key);

  @override
  State<TopicPage> createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
  List<Photo>? photos;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getPhotos();
  }

  getPhotos() async {
    photos = await RemoteService().getPhotos(widget.topic.id);
    if (photos != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.topic.name)),
        body: Visibility(
          visible: isLoaded,
          replacement: const Center(child: CircularProgressIndicator()),
          child: ListView.builder(
              itemCount: photos?.length,
              itemBuilder: (context, index) {
                return Container(child: Image.network(photos![index].url));
              }),
        ));
  }
}
