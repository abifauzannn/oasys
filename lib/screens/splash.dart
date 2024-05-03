import '../widgets/splash/button_section.dart';
import '../widgets/splash/onboarding_section.dart';
import '../widgets/splash/header_section.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: screenHeight, // Mengatur tinggi container sesuai dengan tinggi layar
          width: screenWidth,
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,  // Menempatkan widget di ujung bawah
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HeaderSection(
                image: 'assets/images/oasys-logo.png',
              ),
              OnboardingSection(
                image: 'assets/images/onboarding.png',
              ),
              ButtonSection(),
            ],
          ),
        ),
      ),
    );
  }
}
