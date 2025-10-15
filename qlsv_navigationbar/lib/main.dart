import 'package:flutter/material.dart';
import 'widget/navigation_shell.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quản lý sinh viên',
      home: NavigationShell(),
    );
  }
}
