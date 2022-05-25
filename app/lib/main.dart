import 'package:app/models/topic.dart';
import 'package:app/views/topic_page.dart';
import 'package:flutter/material.dart';
import 'views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brain+',
      routes: {
        '/food': (context) => TopicPage(topic: Topic(id: 'food', name: 'Food')),
        '/art': (context) => TopicPage(topic: Topic(id: 'art', name: 'Art')),
        '/my-childhood': (context) =>
            TopicPage(topic: Topic(id: 'my-childhood', name: 'My Childhood')),
        '/household-items': (context) => TopicPage(
            topic: Topic(id: 'household-items', name: 'Household Items')),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
