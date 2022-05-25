import 'package:app/views/art.dart';
import 'package:app/views/food.dart';
import 'package:app/views/householdItems.dart';
import 'package:app/views/my_childhood_page.dart';
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
      title: 'Flutter Demo',
      routes: {
        '/food': (context) => const Food(),
        '/art': (context) => const Art(),
        '/my-childhood': (context) => const MyChildhood(),
        '/household-items': (context) => const HouseholdItems(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
