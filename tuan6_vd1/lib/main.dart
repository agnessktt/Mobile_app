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
          backgroundColor: Colors.grey,
          title: const Text('Demo'),
        ),
        body: const Center(
          child: MyCheckbox(),
        ),
      ),
    );
  }
}

class MyCheckbox extends StatefulWidget {
  const MyCheckbox({super.key});

  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  bool gt = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('CNTT'),
          subtitle: Text('cong nghe thong tin'),
          trailing: Icon(Icons.info),
          selectedColor: Colors.red,
          leading: Checkbox(value: gt, onChanged: (value) {
            setState(() {
              gt = value!;
            });
          }),
        ),
        CheckboxListTile(
          value: gt,
          onChanged: (value) {
            setState(() {
              gt = value!;
            });
          },
        ),
      ],
    );
  }
}