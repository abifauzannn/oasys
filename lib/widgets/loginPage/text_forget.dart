import 'package:flutter/material.dart';
import '../../screens/forget_password.dart';

class TextForget extends StatelessWidget {
  const TextForget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              // Navigasi ke halaman ForgetPassword
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ForgetPassword(), // Gantikan dengan nama halaman ForgetPassword Anda
                ),
              );
            },
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                fontFamily: 'poppins',
                color: Color(0xFF0082CD), // Mengubah warna ke format yang valid
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          SizedBox(width: 5),
        ],
      ),
    );
  }
}
