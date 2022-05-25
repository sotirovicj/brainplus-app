import 'package:flutter/material.dart';

import '../models/photo.dart';
import '../services/remote_services.dart';

class HouseholdItems extends StatefulWidget {
  const HouseholdItems({Key? key}) : super(key: key);

  @override
  State<HouseholdItems> createState() => _HouseholdItemsState();
}

class _HouseholdItemsState extends State<HouseholdItems> {
  List<Photo>? photos;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getPhotos();
  }

  getPhotos() async {
    photos = await RemoteService().getPhotos('household-items');
    if (photos != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Household Items')),
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
