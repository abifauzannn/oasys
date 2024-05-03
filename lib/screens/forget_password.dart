import 'package:flutter/material.dart';
import '../widgets/bottomNavigation/bottom_navigation.dart';
import '../widgets/forgetPassword/button_section.dart';
import '../widgets/forgetPassword/form_section.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 50), // Spasi tambahan
              ButtonSection(),
              FormSection(),
            ],
          ),
        ),
      ),
    );
  }
}
