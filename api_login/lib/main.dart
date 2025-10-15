import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Map data;
  late List userData;

  // Hàm gọi API
  Future getData() async {
    http.Response response =
    await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    setState(() {
      var convertDataToJson = json.decode(response.body);
      data = convertDataToJson;
      userData = data["data"];
    });
  }

  @override
  void initState() {
    super.initState();
    getData(); // Gọi API khi màn hình được khởi tạo
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fetch API Data"),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: userData == null ? 0 : userData.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10.0),
            color: Colors.white,
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(userData[index]["avatar"]),
              ),
              title: Text(
                "${userData[index]["first_name"]} ${userData[index]["last_name"]}",
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(userData[index]["email"]),
            ),
          );
        },
      ),
    );
  }
}

