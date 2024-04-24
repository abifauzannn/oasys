import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  final String image;

  const HeaderSection({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.0), // Padding kanan dan kiri
      child: Column(
        // Menggunakan Column untuk mengelompokkan gambar dan teks
        mainAxisAlignment: MainAxisAlignment.center, // Membuat teks menjadi berada di tengah
        crossAxisAlignment: CrossAxisAlignment.center, // Membuat teks menjadi berada di tengah
        children: [
          Image.asset(
            image,
            width: 91,
            height: 91,
          ),
          const SizedBox(height: 10), // Spacer antara gambar dan teks
          const Text(
            'Oasys Mobile',
            textAlign: TextAlign.center, // Mengatur teks agar menjadi tengah
            style: TextStyle(
              fontFamily: 'poppins',
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Operational and Academic System Mobile',
            textAlign: TextAlign.center, // Mengatur teks agar menjadi tengah
            style: TextStyle(
              fontFamily: 'poppins',
              fontSize: 16,
              fontWeight: FontWeight.w200,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
