import 'package:flutter/material.dart';
import '../widgets/loginPage/header_section.dart';
import '../widgets/loginPage/form_section.dart';
import '../widgets/loginPage/text_forget.dart';
import '../widgets/loginPage/onboarding_section.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 25),
                    HeaderSection(),
                    SizedBox(height: 5),
                    FormSection(),
                    SizedBox(height: 20),
                    TextForget(),
                    OnboardingSection(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
