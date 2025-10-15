import 'package:flutter/material.dart';
import 'homepage.dart';

class Mythongke extends StatelessWidget {
  const Mythongke({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('day la trang thong ke'),
        backgroundColor: Colors.blue,
      ), // AppBar
      body: Card(
        elevation: 5,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
                child: Text('Chuyen sang trang homepage'),
              ),
            ],
          ),
        ), // Container
      ), // Card
    ); // Scaffold
  }
}
