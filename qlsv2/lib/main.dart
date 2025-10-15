import 'package:flutter/material.dart';
import 'package:qlsv2/widgets/quanly_sinhvien.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quản lý sinh viên",
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quản lý sinh viên"),
      ),
      body: QuanLySinhVien(),
    );
  }
}