import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentUI(),
    );
  }
}

class StudentUI extends StatelessWidget {
  const StudentUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Quản lý sinh viên"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Quan ly sinh vien",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(labelText: "Ma sinh vien"),
            ),
            const TextField(
              decoration: InputDecoration(labelText: "Ho va ten"),
            ),
            const TextField(
              decoration: InputDecoration(labelText: "Diem tot nghiep"),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: null,
                child: const Text("Them sinh vien"),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  buildStudentCard("8.2", "12345678 - Nguyễn Văn Cường",
                      "2002-08-20 00:00:00.000"),
                  buildStudentCard("7.9", "24598752 - Trần Hồng Nhung",
                      "1999-12-07 00:00:00.000"),
                  buildStudentCard("7.9", "123456 - Trần Hồng Hà",
                      "1999-12-07 00:00:00.000"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStudentCard(String score, String title, String subtitle) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.purple, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            score,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.purple),
          ),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
