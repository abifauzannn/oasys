import 'package:flutter/material.dart';

class DetailNilai extends StatelessWidget {
  const DetailNilai ({Key? key}) : super(key: key);

  Widget periodeAkademmik() {
    return Text(
      'Periode 23/24 - Genap',
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.blue[400],
      ),
    );
  }

  Widget listTitle() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Daftar Mata Kuliah',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        SizedBox(width: 10), // Tambahkan spasi antara teks
        Text(
          'Indeks',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget InfoMataKuliah() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Algoritma Pemrograman',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 10), // Tambahkan spasi antara teks
            Text(
              'A',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(height: 3),
        Text('4 MKU 710 - Smt 4',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            periodeAkademmik(),
            Divider(
              color: Colors.grey.withOpacity(
                  0.3), // Memberikan opacity 50% pada warna abu-abu
              thickness: 1,
              height: 20,
              indent: 0,
              endIndent: 0,
            ),
            // listTitle(),
            // SizedBox(height: screenHeight * 0.02),
            // InfoMataKuliah(),
            // SizedBox(height: screenHeight * 0.02),
            // InfoMataKuliah(),
            // SizedBox(height: screenHeight * 0.02),
            // InfoMataKuliah(),
            // SizedBox(height: screenHeight * 0.02),
            // InfoMataKuliah(),
            // SizedBox(height: screenHeight * 0.02),
            // InfoMataKuliah(),
            // SizedBox(height: screenHeight * 0.02),
            // InfoMataKuliah(),
            // SizedBox(height: screenHeight * 0.02),
            // InfoMataKuliah(),
            NoNilai(),
          ]),
        ),
      ),
    );
  }
}

class NoNilai extends StatelessWidget {
  const NoNilai({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/noresult.png',
            width: screenWidth * 0.6,
            height: screenWidth * 0.6,
            fit: BoxFit.cover,
          ),
          SizedBox(height: screenHeight * 0.03), // Spasi antara gambar dan teks
          Text(
            'Oops!',
            style: TextStyle(
              fontFamily: 'poppins',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.blue[900],
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          Text(
              'Sepertinya daftar nilai kamu belum tersedia untuk saat ini ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w400)), // Spasi antara gambar dan teks
        ],
      ),
    );
  }
}