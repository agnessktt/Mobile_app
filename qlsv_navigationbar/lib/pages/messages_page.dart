import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: const [
        Align(
          alignment: Alignment.centerRight,
          child: Chip(label: Text("Hello!")),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Chip(label: Text("Hi, how are you?")),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Chip(label: Text("I'm good, thanks.")),
        ),
      ],
    );
  }
}
