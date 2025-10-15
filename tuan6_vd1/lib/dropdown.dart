import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dropdown Demo"),
        ),
        body: const Center(
          child: DropdownExample(),
        ),
      ),
    );
  }
}

class DropdownExample extends StatefulWidget {
  const DropdownExample({super.key});

  @override
  State<DropdownExample> createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  String? selectedValue;

  final List<String> items = ["CNTT", "Kinh tế", "Ngôn ngữ"];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: const Text("Chọn ngành học"), // placeholder
      value: selectedValue,
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          selectedValue = newValue!;
        });
      },
    );
  }
}
