import 'package:flutter/material.dart';
import 'package:oasys/widgets/academicPage/rencanaStudi/mata_kuliah_section.dart';
import 'package:oasys/widgets/homePage/carousel_section.dart';
import 'package:oasys/widgets/informationPage/list_section.dart';
import 'package:oasys/widgets/informationPage/title_section.dart';
import '../../widgets/academicPage/rencanaStudi/sks_section.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TitleSection(),
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.02,
                  horizontal: screenWidth * 0.03),
              child: SingleChildScrollView(
                // Tambahkan SingleChildScrollView di sini
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ListInformation(),
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
