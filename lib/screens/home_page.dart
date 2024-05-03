import 'package:flutter/material.dart';
import 'package:oasys/widgets/homePage/carousel_section.dart';
import '../widgets/bottomNavigation/bottom_navigation.dart';
import '../widgets/homePage/header_section.dart';
import '../widgets/homePage/akademik_section.dart';
import '../widgets/homePage/profil_akademik_section.dart';
import '../widgets/homePage/status_akademik_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
            return Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02, horizontal: screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  HeaderSection(),
                  SizedBox(height: screenHeight * 0.02),
                  CarouselSection(),
                  SizedBox(height: screenHeight * 0.01),
                  AkademikSection(),
                  SizedBox(height: screenHeight * 0.01),
                  ProfilAkademikSection(),
                  SizedBox(height: screenHeight * 0.01),
                  StatusAkademik(),
                ],
              ),
            );
          },
        ),
      ),
      // bottomNavigationBar: BottomNavigation(),
    );
  }
}
