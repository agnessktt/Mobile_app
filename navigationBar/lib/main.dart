import 'package:flutter/material.dart';
import 'widget/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // tắt logo debug
      title: 'Quan ly sinh vien',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(), // gọi sang homepage.dart
    );
  }
}
