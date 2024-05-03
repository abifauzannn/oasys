import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({Key? key}) : super(key: key);

  Widget imageUser() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        image: DecorationImage(
            image: AssetImage('assets/images/oasys-logo.png'),
            fit: BoxFit.cover),
      ),
    );
  }

  Widget nameUser() {
    return Text('Hello, Joko William',
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'poppins'));
  }

  Widget nimUser() {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/svg/award.svg', // Ganti dengan path gambar yang sesuai
          width: 16,
          height: 16,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 5), // Memberikan jarak antara image dan Text
        Text(
          'NIM : 123456789',
          style: TextStyle(
            fontSize: 14,
            color: Colors.yellow,
            fontFamily: 'poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget userProfile() {
    return Container(
      child: Row(children: [
        imageUser(),
        SizedBox(width: 10),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          nameUser(),
          SizedBox(height: 3),
          nimUser(),
        ])
      ]),
    );
  }

  Widget calendarImage() {
    return SvgPicture.asset(
      'assets/svg/calendar.svg',
      width: 40,
      height: 40,
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    

    return Padding(
      padding: EdgeInsets.all(0.0), // Gunakan 5% dari tinggi layar
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 0), // Hapus padding horizontal di sini
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  userProfile(),
                  calendarImage(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
