import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/students_page.dart';
import '../pages/notifications_page.dart';
import '../pages/messages_page.dart';
import '../pages/settings_page.dart';

class NavigationShell extends StatefulWidget {
  const NavigationShell({super.key});

  @override
  State<NavigationShell> createState() => _NavigationShellState();
}

class _NavigationShellState extends State<NavigationShell> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    StudentsPage(),
    NotificationsPage(),
    MessagesPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.people), label: "Students"),
          NavigationDestination(icon: Icon(Icons.notifications), label: "Notifications"),
          NavigationDestination(icon: Icon(Icons.message), label: "Messages"),
          NavigationDestination(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}
