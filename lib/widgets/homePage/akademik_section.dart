import 'package:flutter/material.dart';

class AkademikSection extends StatelessWidget {
  const AkademikSection({Key? key}) : super(key: key);

  Widget periodeAkademik() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Periode Akademik',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 5), // Menggunakan height daripada width untuk spasi
        Text(
          'Genap 2023/2024 (Smt. 6)',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget ipkUser() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow[600],
        borderRadius: BorderRadius.circular(10), // Menambahkan border radius
      ),
      padding: EdgeInsets.all(7.0),
      child: Column(
        children: [
          Text(
            'IPK : ',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.blue[900],
            )
          ),
          Text(
            '3.85',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.blue[900],
            )
          )
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          periodeAkademik(),
          ipkUser(),
        ],
      ),
    );
  }
}
