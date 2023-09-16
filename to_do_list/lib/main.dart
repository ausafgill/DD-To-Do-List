import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:to_do_list/screens/home_screen.dart';

void main() async {
//initalizing the hive
  await Hive.initFlutter();
  //open a box
  var box = await Hive.openBox('myBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      theme: ThemeData(primarySwatch: Colors.yellow),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
