import 'package:flutter/material.dart';
import 'package:oasys/models/nilai.dart';
import 'package:oasys/api/auth_api.dart';

class SksInformation extends StatefulWidget {
  const SksInformation({Key? key}) : super(key: key);

  @override
  _SksInformationState createState() => _SksInformationState();
}

class _SksInformationState extends State<SksInformation> {
  late Future<Nilai?> _nilaiFuture;

  @override
  void initState() {
    super.initState();
    _nilaiFuture = AuthApi.getNilai();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Nilai?>(
      future: _nilaiFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData && snapshot.data != null) {
          final nilai = snapshot.data!;
          return _buildSksInformation(context, nilai);
        } else {
          return Text('No data available');
        }
      },
    );
  }

  Widget _buildSksInformation(BuildContext context, Nilai nilai) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Flexible(
          child: TotalIpk(ipk: nilai.penilaianInfo.ipk.toDouble()),
        ),
        SizedBox(width: screenWidth * 0.02),
        Flexible(
          child: TotalIps(totalIps: nilai.penilaianInfo.ips.toDouble()),
        ),
        SizedBox(width: screenWidth * 0.02),
        Flexible(
          child: NilaiRata(nilai: nilai.penilaianInfo.nilaiRata),
        ),
      ],
    );
  }
}

// Other Widget classes remain unchanged...


class TotalIpk extends StatelessWidget {
  const TotalIpk({Key? key, required this.ipk}) : super(key: key);
  final double ipk;
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
                  'IPK',
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
                  '$ipk',
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

class TotalIps extends StatelessWidget {
  const TotalIps({Key? key, required this.totalIps}) : super(key: key);
  final double totalIps;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
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
                  'IPS',
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
                  '$totalIps',
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

class NilaiRata extends StatelessWidget {
  const NilaiRata({Key? key, required this.nilai}) : super(key: key);
  final int nilai;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
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
                  'Nilai rata2',
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
                  '$nilai',
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
