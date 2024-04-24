import 'package:flutter/material.dart';

class OnboardingSection extends StatelessWidget {
  const OnboardingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0), // Padding kanan dan kiri
      child: Column(
        // Menggunakan Column untuk mengelompokkan gambar dan teks
        children: [
          ClipRect(
            child: Align(
              alignment: Alignment.bottomCenter,
              heightFactor: 0.85, // Tingkatkan untuk memotong lebih dari bagian bawah
              child: FractionalTranslation(
                translation: Offset(0, 0.20), // Geser ke atas sejauh 20% dari tinggi gambar
                child: Image.asset(
                  'assets/images/onboarding.png',
                  width: 347,
                  fit: BoxFit.cover,  // Menggunakan BoxFit.cover untuk mencrop gambar
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
