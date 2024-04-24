import '../widgets/splash/button_section.dart';
import '../widgets/splash/onboarding_section.dart';
import '../widgets/splash/header_section.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end, // Mulai dari akhir (bawah)
          children: const [
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
    );
  }
}
