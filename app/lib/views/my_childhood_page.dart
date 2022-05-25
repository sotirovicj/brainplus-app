import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import '../models/photo.dart';
import '../services/remote_services.dart';

class MyChildhood extends StatefulWidget {
  const MyChildhood({Key? key}) : super(key: key);

  @override
  State<MyChildhood> createState() => _MyChildhoodState();
}

class _MyChildhoodState extends State<MyChildhood> {
  List<Photo>? photos;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getPhotos();
  }

  getPhotos() async {
    photos = await RemoteService().getPhotos('my-childhood');
    if (photos != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('My Childhood')),
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
