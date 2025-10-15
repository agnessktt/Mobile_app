import "package:flutter/material.dart";

class FormNhapSinhVien extends StatelessWidget {
  final Function addSinhVien;
  final maController = TextEditingController();
  final hoVaTenController = TextEditingController();
  final diemTotNghiepController = TextEditingController();

  FormNhapSinhVien(this.addSinhVien);

  submitData() {
    final enterMaController = maController.text;
    final enterHoVaTenController = hoVaTenController.text;
    final enterDiemTotNghiepController = diemTotNghiepController.text;

    if((int.parse(enterMaController) != null) &&
        (enterHoVaTenController.length > 3) &&
        (double.parse(enterDiemTotNghiepController) != null))
      addSinhVien(
        int.parse(enterMaController),
        enterHoVaTenController,
        double.parse(enterDiemTotNghiepController),
      );
    else
      return;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Mã sinh viên',
              ),
              controller: maController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Họ và tên',
              ),
              controller: hoVaTenController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Điểm tốt nghiệp',
              ),
              controller: diemTotNghiepController,
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
              child: Text('Thêm sinh viên'),
              onPressed: () {
                submitData();
              },
            ),
          ],
        ),
      ),
    );
  }
}
