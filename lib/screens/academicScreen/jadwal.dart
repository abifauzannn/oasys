import 'package:flutter/material.dart';
import 'package:oasys/widgets/academicPage/kehadiran/kehadiran_section.dart';
import 'package:oasys/widgets/academicPage/jadwal/jadwal_section.dart';


class Jadwal  extends StatelessWidget {
  const Jadwal ({Key? key}) : super(key: key);

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
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01, horizontal: screenWidth * 0.03),
              child: SingleChildScrollView( // Tambahkan SingleChildScrollView di sini
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Tambahkan widget-widget Anda di sini
                    JadwalTab(),
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
