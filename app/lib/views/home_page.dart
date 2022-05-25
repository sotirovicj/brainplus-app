import 'package:app/models/topic.dart';
import 'package:app/services/remote_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Topic>? topics;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getTopics();
  }

  getTopics() async {
    topics = await RemoteService().getTopics();
    if (topics != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Brain+')),
        body: Visibility(
          visible: isLoaded,
          replacement: const Center(child: CircularProgressIndicator()),
          child: ListView.builder(
              itemCount: topics?.length,
              itemBuilder: (context, index) {
                return ElevatedButton(
                    onPressed: () {
                      RemoteService().incrementCounter('${topics![index].id}');
                      Navigator.pushNamed(context, '/${topics![index].id}');
                    },
                    child: Text(topics![index].name));
              }),
        ));
  }
}
