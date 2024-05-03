import 'package:flutter/material.dart';

class JadwalTab extends StatelessWidget {
  const JadwalTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran layar
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: screenWidth, // Lebar kontainer sama dengan lebar layar
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListJadwal(),
                SizedBox(height: screenHeight * 0.02),
                ListJadwal(),
                SizedBox(height: screenHeight * 0.02),
                NoJadwal(),
                SizedBox(height: screenHeight * 0.02),
                ListJadwal(),
                SizedBox(height: screenHeight * 0.02),
                NoJadwal(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget untuk menampilkan nama hari dan garis pembatas
class NamaHari extends StatelessWidget {
  const NamaHari({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran layar
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Baris untuk menampilkan nama hari
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/calendar.png',
              width: screenWidth * 0.06,
              height: screenHeight * 0.04,
              fit: BoxFit.cover,
            ),
            SizedBox(width: screenWidth * 0.02),
            Text(
              'SENIN',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        // Garis pembatas antara hari dan jadwal
        Divider(
          color: Colors.grey.withOpacity(0.3),
          thickness: 1,
          height: 20,
        ),
      ],
    );
  }
}

// Widget untuk menampilkan informasi kelas
class InformasiKelas extends StatelessWidget {
  const InformasiKelas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran layar
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      child: Column(
        children: [
          // Baris untuk menampilkan informasi kelas
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '4 MKU 710 - R.091',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.02,
                  vertical: screenHeight * 0.001,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '08.00 - 10.00 WIB',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Widget untuk menampilkan informasi mata kuliah
class InformasiMataKuliah extends StatelessWidget {
  const InformasiMataKuliah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran layar
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Text(
      'Algoritma Pemrograman',
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );
  }
}

class InformasiDosen extends StatelessWidget {
  const InformasiDosen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Image.asset(
        'assets/images/user.png',
        width: screenWidth * 0.04,
        height: screenHeight * 0.03,
        fit: BoxFit.cover,
      ),
      SizedBox(width: screenWidth * 0.02),
      Text(
        'Prof. Dr. Sunandar, M.Sc.',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      )
    ]);
  }
}

// Widget untuk menampilkan satu kartu jadwal
class CardJadwal extends StatelessWidget {
  const CardJadwal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran layar
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Informasi kelas
            InformasiKelas(),
            // Informasi mata kuliah
            SizedBox(height: screenHeight * 0.006),
            InformasiMataKuliah(),
            SizedBox(height: screenHeight * 0.006),
            InformasiDosen(),
          ],
        ),
      ),
    );
  }
}

class TextNoJadwal extends StatelessWidget {
  const TextNoJadwal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Tidak ada jadwal',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
      ),
    );
  }
}

// Widget untuk menampilkan daftar jadwal
class ListJadwal extends StatelessWidget {
  const ListJadwal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran layar
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Nama hari dan garis pembatas
        NamaHari(),
        // Satu kartu jadwal
        CardJadwal(),
      ],
    );
  }
}

class NoJadwal extends StatelessWidget {
  const NoJadwal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran layar
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Nama hari dan garis pembatas
        NamaHari(),
        // Satu kartu jadwal
        TextNoJadwal(),
      ],
    );
  }
}
