import 'package:flutter/material.dart';
import 'package:liverpool_list/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liverpoolist',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 223, 8, 8)),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}