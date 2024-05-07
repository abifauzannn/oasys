import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../api/auth_api.dart';
import '../../models/homepage.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<HomePage?>(
      future: AuthApi.getHomePage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData && snapshot.data != null) {
          final header = snapshot.data!;
          return _buildHeader(context, header);
        } else {
          return Text('No data available');
        }
      },
    );
  }

  Widget _buildHeader(BuildContext context, HomePage header) {
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
                  userProfile(header.infoMahasiswa.nama, header.infoMahasiswa.nim),
                  calendarImage(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

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

  Widget nameUser(String name) {
    String firstName = name.split(' ')[0];
    return Text('Hello, $firstName',
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'poppins'));
  }

  Widget nimUser(String nim) {
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
          'NIM : $nim',
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

  Widget userProfile(String name, String nim) {
    return Container(
      child: Row(children: [
        imageUser(),
        SizedBox(width: 10),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          nameUser(name),
          SizedBox(height: 3),
          nimUser(nim),
        ])
      ]),
    );
  }

  Widget calendarImage() {
    return SvgPicture.asset(
      'assets/svg/calendar.svg',
      width: 32,
      height: 32,
      fit: BoxFit.cover,
    );
  }
}
