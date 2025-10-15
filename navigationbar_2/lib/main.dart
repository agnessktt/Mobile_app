import 'package:flutter/material.dart';
import 'package:navigationbar_2/header.dart';
import 'contacts.dart';
import 'dashboard.dart';
import 'events.dart';
import 'notes.dart';
import 'notifications.dart';
import 'privacy_policy.dart';
import 'send_feedback.dart';
import 'settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.dashboard;

  @override
  Widget build(BuildContext context) {
    Widget container;
    if (currentPage == DrawerSections.dashboard) {
      container = const DashboardPage();
    } else if (currentPage == DrawerSections.contacts) {
      container = const ContactsPage();
    } else if (currentPage == DrawerSections.events) {
      container = const EventsPage();
    } else if (currentPage == DrawerSections.notes) {
      container = const NotesPage();
    } else if (currentPage == DrawerSections.notifications) {
      container = const NotificationsPage();
    } else if (currentPage == DrawerSections.privacyPolicy) {
      container = const PrivacyPolicyPage();
    } else if (currentPage == DrawerSections.settings) {
      container = const SettingsPage();
    } else if (currentPage == DrawerSections.sendFeedback) {
      container = const SendFeedbackPage();
    } else {
      container = const DashboardPage();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('TRANG CHỦ'),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MyHeader(),
              myDrawerList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget myDrawerList() {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          menuItem(1, "Dashboard", Icons.dashboard,
              currentPage == DrawerSections.dashboard),
          menuItem(2, "Contacts", Icons.people,
              currentPage == DrawerSections.contacts),
          menuItem(3, "Events", Icons.event,
              currentPage == DrawerSections.events),
          menuItem(4, "Notes", Icons.notes,
              currentPage == DrawerSections.notes),
          menuItem(5, "Notifications", Icons.notifications,
              currentPage == DrawerSections.notifications),
          menuItem(6, "Privacy Policy", Icons.privacy_tip,
              currentPage == DrawerSections.privacyPolicy),
          menuItem(7, "Settings", Icons.settings,
              currentPage == DrawerSections.settings),
          menuItem(8, "Send Feedback", Icons.feedback,
              currentPage == DrawerSections.sendFeedback),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.contacts;
            } else if (id == 3) {
              currentPage = DrawerSections.events;
            } else if (id == 4) {
              currentPage = DrawerSections.notes;
            } else if (id == 5) {
              currentPage = DrawerSections.notifications;
            } else if (id == 6) {
              currentPage = DrawerSections.privacyPolicy;
            } else if (id == 7) {
              currentPage = DrawerSections.settings;
            } else if (id == 8) {
              currentPage = DrawerSections.sendFeedback;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 20,
                color: Colors.black,
              ),
              const SizedBox(width: 20),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  contacts,
  events,
  notes,
  notifications,
  privacyPolicy,
  settings,
  sendFeedback,
}
