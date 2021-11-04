import 'package:flutter/material.dart';

import 'view/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github Users App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.blue,
        primarySwatch: Colors.blue,
      ),
      home: const HomeView(),
    );
  }
}
