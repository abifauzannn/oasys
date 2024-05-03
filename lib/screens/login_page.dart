import 'package:flutter/material.dart';
import '../widgets/LoginPage/onboarding_section.dart';
import '../widgets/LoginPage/form_section.dart';
import '../widgets/LoginPage/header_section.dart';
import '../widgets/LoginPage/text_forget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: screenHeight * 0.02),
              const HeaderSection(),
              SizedBox(height: screenHeight * 0.02),
              const FormSection(),
              SizedBox(height: screenHeight * 0.03),
              const TextForget(),
              SizedBox(height: screenHeight * 0.02),
              const OnboardingSection(),

            ],
          ),
        ),
      ),
    );
  }
}
