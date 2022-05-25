import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import '../models/photo.dart';
import '../services/remote_services.dart';

class Food extends StatefulWidget {
  const Food({Key? key}) : super(key: key);

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  List<Photo>? photos;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getPhotos();
  }

  getPhotos() async {
    photos = await RemoteService().getPhotos('food');
    if (photos != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Food'),
          actions: const <Widget>[BackButton()],
        ),
        body: Visibility(
          visible: isLoaded,
          child: ListView.builder(
              itemCount: photos?.length,
              itemBuilder: (context, index) {
                return Container(child: Image.network(photos![index].url));
              }),
          replacement: const Center(child: CircularProgressIndicator()),
        ));
  }
}
