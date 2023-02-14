import 'package:flutter/material.dart';
import 'package:flutter_bloc_concepts/features/home/screens/home._page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp
    (
      title: 'Flutter Demo',
      theme: ThemeData
      (
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage
      (
        title: 'Flutter Demo Home Page'
      ),
    );
  }
}


