import 'package:flutter/material.dart';
import 'package:oasys/widgets/profilePage/button_section.dart';
import 'package:oasys/widgets/profilePage/header_section.dart';
import 'package:oasys/widgets/profilePage/user_form_section.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02, horizontal: screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Profile',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    HeaderSection(),
                    SizedBox(height: screenHeight * 0.02),
                    FormProfile(),
                    SizedBox(height: screenHeight * 0.02),
                    ButtonSection(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      // bottomNavigationBar: BottomNavigation(),
    );
  }
}
