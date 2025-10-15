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
      home: StudentManager(),
    );
  }
}

class Student {
  String id;
  String name;
  double score;
  DateTime dob;

  Student({
    required this.id,
    required this.name,
    required this.score,
    required this.dob,
  });
}

class StudentManager extends StatefulWidget {
  const StudentManager({super.key});
  @override
  State<StudentManager> createState() => _StudentManagerState();
}

class _StudentManagerState extends State<StudentManager> {
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _scoreController = TextEditingController();

  final List<Student> students = [];
  int? _editingIndex;

  void _addOrUpdateStudent() {
    if (_idController.text.isEmpty ||
        _nameController.text.isEmpty ||
        _scoreController.text.isEmpty) {
      return;
    }

    if (_editingIndex == null) {
      setState(() {
        students.add(
          Student(
            id: _idController.text,
            name: _nameController.text,
            score: double.tryParse(_scoreController.text) ?? 0.0,
            dob: DateTime.now(),
          ),
        );
      });
    } else {
      setState(() {
        students[_editingIndex!] = Student(
          id: _idController.text,
          name: _nameController.text,
          score: double.tryParse(_scoreController.text) ?? 0.0,
          dob: students[_editingIndex!].dob,
        );
        _editingIndex = null;
      });
    }

    _idController.clear();
    _nameController.clear();
    _scoreController.clear();
  }

  void _editStudent(int index) {
    final student = students[index];
    setState(() {
      _idController.text = student.id;
      _nameController.text = student.name;
      _scoreController.text = student.score.toString();
      _editingIndex = index;
    });
  }

  void _deleteStudent(int index) {
    setState(() {
      students.removeAt(index);
      if (_editingIndex == index) {
        _editingIndex = null;
        _idController.clear();
        _nameController.clear();
        _scoreController.clear();
      }
    });
  }

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
            const Text("Quản lý sinh viên",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            TextField(
              controller: _idController,
              decoration: const InputDecoration(labelText: "Mã sinh viên"),
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Họ và tên"),
            ),
            TextField(
              controller: _scoreController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Điểm tốt nghiệp"),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: _addOrUpdateStudent,
                child: Text(_editingIndex == null
                    ? "Thêm sinh viên"
                    : "Cập nhật sinh viên"),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  final student = students[index];
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
                          student.score.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      title: Text("${student.id} - ${student.name}"),
                      subtitle: Text(student.dob.toString()),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => _editStudent(index),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteStudent(index),
                          ),
                        ],
                      ),
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
