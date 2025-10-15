import 'package:flutter/material.dart';
import '../models/sinhvien.dart';

class DanhSachSinhVien extends StatelessWidget {
  final List<SinhVien> danhSachSinhVien;

  DanhSachSinhVien(this.danhSachSinhVien);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300, // Giới hạn chiều cao để tránh tràn màn hình
      child: SingleChildScrollView(
        child: Column(
          children: danhSachSinhVien.map((sv) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    // Hiển thị điểm tốt nghiệp
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        sv.diemTotNghiep.toStringAsFixed(1),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    // Hiển thị thông tin sinh viên
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${sv.ma} - ${sv.hoVaTen}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateTime.now().difference(sv.ngaySinh).inDays.toString() + " ngày",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
