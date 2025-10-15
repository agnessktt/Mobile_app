import 'package:flutter/material.dart';
import 'thongke.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('day la trang chu'),
        backgroundColor: Colors.green,
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
                    MaterialPageRoute(builder: (context) => Mythongke()),
                  );
                },
                child: Text('Chuyen sang trang thong ke'),
              ),
            ],
          ),
        ), // Container
      ), // Card
    ); // Scaffold
  }
}
