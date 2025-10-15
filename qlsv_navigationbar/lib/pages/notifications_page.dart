import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: const [
        Card(
          child: ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Notification 1"),
            subtitle: Text("Your assignment is due tomorrow."),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Notification 2"),
            subtitle: Text("New message from teacher."),
          ),
        ),
      ],
    );
  }
}
