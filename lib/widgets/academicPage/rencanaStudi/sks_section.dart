import 'package:flutter/material.dart';
import 'package:oasys/models/rencana_studi.dart';
import 'package:oasys/api/auth_api.dart';

class SksInformation extends StatefulWidget {
  const SksInformation({Key? key}) : super(key: key);

  @override
  _SksInformationState createState() => _SksInformationState();
}

class _SksInformationState extends State<SksInformation> {
  late Future<AcademicRencanaStudi?> _sksFuture;

  @override
  void initState() {
    super.initState();
    _sksFuture = AuthApi.getRencanaStudi();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AcademicRencanaStudi?>(
      future: _sksFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData && snapshot.data != null) {
          final sks = snapshot.data!;
          return _buildSksInformation(context, sks);
        } else {
          return Text('No data available');
        }
      },
    );
  }

  Widget _buildSksInformation(BuildContext context, AcademicRencanaStudi sks) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Flexible(
          child: SksDiambil(sks: sks.rencanaStudiInfo.sksDiAmbil.toString())),
        SizedBox(width: screenWidth * 0.01),
        Flexible(child: SksSelesai(sks: sks.rencanaStudiInfo.sksSelesai.toString())),
        SizedBox(width: screenWidth * 0.01),
        Flexible(child: TotalSks(sks: sks.rencanaStudiInfo.sksTotal.toString())),
      ],
    );
  }
}


class SksDiambil extends StatelessWidget {
  const SksDiambil({Key? key, required this.sks}) : super(key: key);
  final String sks;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow[700],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Text(
                  'SKS diambil',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  sks,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue[900],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SksSelesai extends StatelessWidget {
  const SksSelesai({Key? key, required this.sks}) : super(key: key);
  final String sks;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Text(
                  'SKS Selesai',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  sks,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TotalSks extends StatelessWidget {
  const TotalSks({Key? key, required this.sks}) : super(key: key);
  final String sks;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Text(
                  'Total SKS',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  sks,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
