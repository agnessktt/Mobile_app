import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();

  final List<Map<String, String>> _students = [];

  void _addStudent() {
    final name = _nameController.text.trim();
    final id = _idController.text.trim();

    if (name.isNotEmpty && id.isNotEmpty) {
      setState(() {
        _students.add({"name": name, "id": id});
        _nameController.clear();
        _idController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quản lý sinh viên"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Form nhập sinh viên
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Tên sinh viên",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _idController,
              decoration: const InputDecoration(
                labelText: "Mã số sinh viên (MSSV)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addStudent,
              child: const Text("Thêm sinh viên"),
            ),
            const Divider(height: 20),

            // Danh sách sinh viên
            Expanded(
              child: _students.isEmpty
                  ? const Center(child: Text("Chưa có sinh viên nào"))
                  : ListView.builder(
                itemCount: _students.length,
                itemBuilder: (context, index) {
                  final student = _students[index];
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(student["name"]!),
                      subtitle: Text("MSSV: ${student["id"]}"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
