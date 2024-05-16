import 'package:flutter/material.dart';
import 'package:oasys/models/jadwal.dart';
import 'package:oasys/api/auth_api.dart';

class JadwalTab extends StatefulWidget {
  const JadwalTab({Key? key}) : super(key: key);

  @override
  _JadwalTabState createState() => _JadwalTabState();
}

class _JadwalTabState extends State<JadwalTab> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Jadwal?>(
      future: AuthApi.getJadwal(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.hasData && snapshot.data != null) {
          final jadwal = snapshot.data!;
          return _buildList(context, jadwal);
        } else {
          return Text('data');
        }
      },
    );
  }

  Widget _buildList(BuildContext context, Jadwal jadwal) {
    final Map<String, List<JadwalDetail>> jadwalPerHari = {};
    jadwal.daftarJadwal.forEach((jadwalDetail) {
      final hari = jadwalDetail.namaHari;
      jadwalPerHari.putIfAbsent(hari, () => []);
      jadwalPerHari[hari]!.add(jadwalDetail);
    });

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: jadwalPerHari.entries.map((entry) {
          final hari = entry.key;
          final daftarJadwal = entry.value;

          // Cek apakah daftar jadwal kosong atau tidak terdapat nama mata kuliah
          if (daftarJadwal.isEmpty || !daftarJadwal.any((jadwal) => jadwal.namaMatkul.isNotEmpty)) {
            return Column(
              children: [
                SizedBox(height: screenHeight * 0.01), // Jarak antara hari-hari
                _buildEmptySchedule(screenWidth, screenHeight, hari),
              ],
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.01), // Jarak antara hari-hari
              _buildNonEmptySchedule(screenWidth, screenHeight, hari, daftarJadwal),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildEmptySchedule(
    double screenWidth, double screenHeight, String hari) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              'assets/images/calendar.png',
              width: screenWidth * 0.06,
              height: screenHeight * 0.04,
              fit: BoxFit.cover,
            ),
            SizedBox(width: screenWidth * 0.02),
            Text(
              '$hari'.toUpperCase(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Divider(
          color: Colors.grey.withOpacity(0.3),
          thickness: 1,
          height: 20,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              'TIDAK ADA JADWAL',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNonEmptySchedule(double screenWidth, double screenHeight,
      String hari, List<JadwalDetail> daftarJadwal) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              'assets/images/calendar.png',
              width: screenWidth * 0.06,
              height: screenHeight * 0.04,
              fit: BoxFit.cover,
            ),
            SizedBox(width: screenWidth * 0.02),
            Text(
              '$hari'.toUpperCase(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Divider(
          color: Colors.grey.withOpacity(0.3),
          thickness: 1,
          height: 20,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: daftarJadwal.length,
          itemBuilder: (context, index) {
            final jadwalDetail = daftarJadwal[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: JadwalCard(jadwalDetail: jadwalDetail),
            );
          },
        ),
      ],
    );
  }
}

class JadwalCard extends StatelessWidget {
  final JadwalDetail jadwalDetail;

  const JadwalCard({Key? key, required this.jadwalDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
      width: screenWidth,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01, horizontal: screenWidth * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${jadwalDetail.idRuangan}',
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
                    '${jadwalDetail.jamKuliah}',
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
            SizedBox(height: 8),
            Text(
              '${jadwalDetail.namaMatkul}',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Image.asset(
                  'assets/images/user.png',
                  width: screenWidth * 0.04,
                  height: screenHeight * 0.03,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: screenWidth * 0.02),
                Text(
                  '${jadwalDetail.namaDosen}',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
