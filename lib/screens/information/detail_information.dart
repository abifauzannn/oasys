import 'package:flutter/material.dart';
import 'package:oasys/widgets/informationPage/button_section.dart';
import 'package:oasys/widgets/informationPage/detail_section.dart';
import 'package:oasys/models/pengumuman.dart'; // Import model Pengumuman jika belum diimpor

class DetailPage extends StatelessWidget {
  final PengumumanDetail pengumumanDetail; // Tambahkan pengumumanDetail sebagai parameter

  const DetailPage({Key? key, required this.pengumumanDetail}) : super(key: key);

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
                DetailInformation(pengumumanDetail: pengumumanDetail), // Sediakan pengumumanDetail sebagai argumen
              ],
            ),
          ),
        ),
      ),
    );
  }
}
