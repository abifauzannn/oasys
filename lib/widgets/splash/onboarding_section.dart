import 'package:flutter/material.dart';

class OnboardingSection extends StatelessWidget {
  final String image;

  const OnboardingSection({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0), // Padding kanan dan kiri
      child: Column(
        // Menggunakan Column untuk mengelompokkan gambar dan teks
        children: [
          const SizedBox(height: 20),
          Image.asset(
            image,
            width: 347,
            height: 343,
            
          ),
        ],
      ),
    );
  }
}
