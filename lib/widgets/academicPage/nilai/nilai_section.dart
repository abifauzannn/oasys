import 'package:flutter/material.dart';
import 'package:oasys/models/nilai.dart';
import 'package:oasys/api/auth_api.dart';

class DetailNilai extends StatefulWidget {
  const DetailNilai({Key? key}) : super(key: key);

  @override
  _DetailNilaiState createState() => _DetailNilaiState();
}

class _DetailNilaiState extends State<DetailNilai> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Nilai?>(
      future: AuthApi.getNilai(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData && snapshot.data != null) {
          final nilai = snapshot.data!;
          return _buildList(context, nilai);
        } else {
          return NoNilai();
        }
      },
    );
  }

  Widget _buildList(BuildContext context, Nilai nilai) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              periodeAkademmik(nilai.semesterAktif.tahunAwal, nilai.semesterAktif.tahunAkhir),
              Divider(
                color: Colors.grey.withOpacity(0.3),
                thickness: 1,
                height: 20,
                indent: 0,
                endIndent: 0,
              ),
              listTitle(),
              SizedBox(height: screenHeight * 0.01),
              Column(
                children: nilai.penilaian.map((nilai) {
                  return Column(
                    children: [
                      InfoMataKuliah(matkul: nilai), // Widget InfoMataKuliah
                      SizedBox(
                          height: screenHeight *
                              0.01), // Jarak vertikal antara setiap widget InfoMataKuliah
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget periodeAkademmik(String tahunMasuk, String tahunAkhir) {
    return Text(
      'Periode $tahunMasuk/$tahunAkhir',
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

  Widget InfoMataKuliah({required NilaiDetail matkul}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: 
            Text(
              '${matkul.namaMatkul}',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            ), 
            SizedBox(width: 10), // Tambahkan spasi antara teks
            Text(
              '${matkul.hurufIndeks}',
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
        SizedBox(height: 1),
        Text('${matkul.kodeMatkul} - ${matkul.sksMatkul} SKS',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ))
      ],
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
          Text('Sepertinya daftar nilai kamu belum tersedia untuk saat ini ',
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
