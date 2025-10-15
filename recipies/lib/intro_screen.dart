import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  void _showWarningDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("⚠ Thông báo"),
        content: const Text(
            "Khi bạn bấm 'Bắt đầu ngay' mà không đăng nhập thì mọi dữ liệu sẽ không được lưu trữ."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            child: const Text("Đăng nhập"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            child: const Text("Tiếp tục"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Image.asset("assets/logo.png", width: 80, height: 80),
            const SizedBox(height: 20),
            const Text(
              "Công thức nấu ăn mỗi ngày",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Icon(Icons.restaurant_menu,
                                color: Colors.green, size: 40),
                            SizedBox(height: 10),
                            Text("Khám phá món ăn mới",
                                textAlign: TextAlign.center),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.list_alt,
                                color: Colors.orange, size: 40),
                            SizedBox(height: 10),
                            Text("Gợi ý nguyên liệu",
                                textAlign: TextAlign.center),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.favorite,
                                color: Colors.red, size: 40),
                            SizedBox(height: 10),
                            Text("Lưu món yêu thích",
                                textAlign: TextAlign.center),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () => _showWarningDialog(context),
                      child: const Text("Bắt đầu ngay"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      },
                      child: const Text("Đăng nhập"),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
