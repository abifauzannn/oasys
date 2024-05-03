import 'package:flutter/material.dart';
import '../../screens/login_page.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 10.0), // Padding kanan dan kiri
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: Text('Get Started'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(
                  255, 9, 78, 134), // Warna latar belakang tombol
              foregroundColor: Colors.white, // Warna teks
              padding: const EdgeInsets.symmetric(
                  horizontal: 15, vertical: 20), // Padding di dalam tombol
              textStyle: const TextStyle(
                fontFamily: 'poppins',
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              minimumSize: const Size(double.infinity, 0), // Lebar full width
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(15), // Radius sudut membulat
              ),
              shadowColor: Colors.black.withOpacity(0.2), // Warna shadow
              elevation: 5, // Ketinggian shadow
            ),
          ),
        ],
      ),
    );
  }
}
