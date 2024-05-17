import 'package:flutter/material.dart';
import 'package:oasys/models/pengumuman.dart';
import 'package:oasys/widgets/forgetPassword/button_section.dart'; 
import 'package:flutter_html/flutter_html.dart';
// Pastikan Anda mengganti path sesuai dengan struktur proyek Anda

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class DetailInformation extends StatelessWidget {
  final PengumumanDetail pengumumanDetail;

  const DetailInformation({Key? key, required this.pengumumanDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            // Mengembalikan nilai true agar sistem dapat menutup aplikasi
            return false;
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                ButtonSection(),
                BannerInformation(),
                TitleInformation(pengumumanDetail: pengumumanDetail),
                BodyInformation(pengumumanDetail: pengumumanDetail),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



class BannerInformation extends StatelessWidget {
  const BannerInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Image(
      width: screenWidth,
      height: screenHeight * 0.2,
      image: AssetImage('assets/images/bannerinformation.png'),
    );
  }
}

class TitleInformation extends StatelessWidget {
  final PengumumanDetail pengumumanDetail; // Menerima pengumumanDetail sebagai parameter

  const TitleInformation({Key? key, required this.pengumumanDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: screenHeight * 0.01),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
          child: Text(
            pengumumanDetail.judul,
             // Gunakan judul dari pengumumanDetail
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.001),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
          child: Text(
            pengumumanDetail.date, // Gunakan tanggal dari pengumumanDetail
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}

class BodyInformation extends StatelessWidget {
  final PengumumanDetail pengumumanDetail; // Menerima pengumumanDetail sebagai parameter

  const BodyInformation({Key? key, required this.pengumumanDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: screenHeight * 0.02),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
          child: Html(
            data: pengumumanDetail.isi,
            style: {
              'body': Style(
                fontFamily: 'Poppins',
                fontSize: FontSize(14.0),
                color: Colors.black,
              ),
            },
          ),
        ),
      ],
    );
  }
}
