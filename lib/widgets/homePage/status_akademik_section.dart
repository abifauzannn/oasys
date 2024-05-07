import 'package:flutter/material.dart';
import '../../api/auth_api.dart';
import '../../models/homepage.dart';

class StatusAkademik extends StatelessWidget {
  const StatusAkademik({Key? key}) : super(key: key);

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
          return _buildStatus(context, header);
        } else {
          return Text('No data available');
        }
      },
    );
  }

  Widget _buildStatus(BuildContext context, HomePage header) {
    return Expanded(
      child: Row(
        children: [
          Expanded(child: StatusKRS( status: header.statusKrs.namaStatusKrs)),
          SizedBox(width: 10), // Spasi antara kolom
          Expanded(child: StatusKHS( status: header.statusKhs.namaStatusKhs)),
        ],
      ),
    );
  }
}

class StatusKRS extends StatelessWidget {
  const StatusKRS({Key? key, required this.status}) : super(key: key);

  final String status;

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
                Image.asset('assets/images/krs.png', width: 20, height: 20),
                SizedBox(width: screenWidth * 0.02),
                Text(
                  'Status KRS',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  '${status}',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: screenWidth * 0.01),
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StatusKHS extends StatelessWidget {
  const StatusKHS({Key? key, this.status}) : super(key: key);

  final String? status;

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
                Image.asset('assets/images/khs.png', width: 20, height: 20),
                SizedBox(width: screenWidth * 0.02),
                Text(
                  'Status KHS',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  '${status}',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    color: Colors.black,
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
