import 'package:flutter/material.dart';
import 'package:oasys/widgets/informationPage/button_section.dart';
import 'package:oasys/widgets/informationPage/detail_section.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
           padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02, horizontal: screenWidth * 0.05),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Tambahkan lebih banyak konten sesuai kebutuhan
                SizedBox(height: screenHeight * 0.02), // Contoh: Menambahkan jarak antara konten dan tepi layar
                ButtonSection(),
               SizedBox(height: screenHeight * 0.02),// Contoh: Menambahkan jarak antara judul dan konten berikutnya
                DetailInformation(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
