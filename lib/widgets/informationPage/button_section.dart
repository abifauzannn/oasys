import 'package:flutter/material.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03, vertical: screenHeight * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFF6F7FA),  // Warna background abu-abu muda
              borderRadius: BorderRadius.circular(10.0),  // Radius sudut 10.0
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.grey[600]),  // Ikon arrow_back dengan warna abu-abu tua
              onPressed: () {
                Navigator.pop(context);  // Fungsi untuk kembali ke halaman sebelumnya
              },
              splashRadius: 24,  // Ukuran radius efek splash
            ),
          ),
        ],
      ),
    );
  }
}
