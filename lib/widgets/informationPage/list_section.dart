import 'package:flutter/material.dart';
import 'package:oasys/screens/information/detail_information.dart';

class ListInformation extends StatelessWidget {
  const ListInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InformationCard(),
        InformationCard(),
        InformationCard(),
        InformationCard(),
        InformationCard(),
        InformationCard(),
        InformationCard(),
        InformationCard(),
        InformationCard(),
        InformationCard(),
      ],
    );
  }
}

class InformationCard extends StatelessWidget {
  const InformationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          width: screenWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AboutInformation(),
              CustomIcon(),
            ],
          ),
        ),
        Divider(), // Menambahkan Divider di sini
      ],
    );
  }
}

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(right: 8.0), 
      child: GestureDetector(
        onTap: () {
          // Navigasi ke DetailInformation
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailPage()),
          );
        },
        child: Icon(
          Icons.arrow_forward_ios,
          color: Colors.black.withOpacity(0.3),
          size: screenHeight * 0.03,
        ),
      ),
    );
  }
}


class AboutInformation extends StatelessWidget {
  const AboutInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: screenWidth * 0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pengumuman Batas Cetak Kartu Rencana Studi Tahun akademik 2023/2024',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Text(
                'Admin Fakultas - 2 h',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
