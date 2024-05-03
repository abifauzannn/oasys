import 'package:flutter/material.dart';
import 'package:oasys/widgets/academicPage/rencanaStudi/mata_kuliah_section.dart';
import 'package:oasys/widgets/homePage/carousel_section.dart';
import '../../widgets/academicPage/rencanaStudi/sks_section.dart';

class RencanaStudi extends StatelessWidget {
  const RencanaStudi({Key? key}) : super(key: key);

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
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02, horizontal: screenWidth * 0.03),
              child: SingleChildScrollView( // Tambahkan SingleChildScrollView di sini
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Tambahkan widget-widget Anda di sini
                    SksInformation(),
                    SizedBox(height: screenHeight * 0.01),
                    MataKuliah(),
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
