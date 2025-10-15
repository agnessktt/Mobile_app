import 'package:flutter/material.dart';
import 'package:qlsv2/widgets/danhsach_sinhvien.dart';
import 'package:qlsv2/widgets/formnhap_sinhvien.dart';

import '../models/sinhvien.dart';

class QuanLySinhVien extends StatefulWidget {
  @override
  _QuanLySinhVienState createState() => _QuanLySinhVienState();
}

class _QuanLySinhVienState extends State<QuanLySinhVien> {
  final List<SinhVien> danhSachSinhVien = [
    SinhVien(
      ma: '12345678',
      hoVaTen: "Nguyen Thi Huong",
      ngaySinh: DateTime(2002, 8, 20),
      diemTotNghiep: 8.2,
    ),
    SinhVien(
      ma: '22334455',
      hoVaTen: "Tran Van Doan",
      ngaySinh: DateTime(1999, 12, 7),
      diemTotNghiep: 7.9,
    ),
  ];

  void addSinhVien(int ma, String hoVaTen, double diemTotNghiep) {
    final newSinhVien = SinhVien(
      ma: ma.toString(),
      hoVaTen: hoVaTen,
      ngaySinh: DateTime.now(), // tạm thời set ngày sinh = hiện tại
      diemTotNghiep: diemTotNghiep,
    );

    setState(() {
      danhSachSinhVien.add(newSinhVien);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormNhapSinhVien(addSinhVien),
        DanhSachSinhVien(danhSachSinhVien),
      ],
    );
  }
}
