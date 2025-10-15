import 'package:flutter/material.dart';

class StudentsPage extends StatelessWidget {
  const StudentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Card(
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text("Nguyen Van A"),
            subtitle: Text("MSSV: 001"),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text("Tran Thi B"),
            subtitle: Text("MSSV: 002"),
          ),
        ),
      ],
    );
  }
}
