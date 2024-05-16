import 'package:flutter/material.dart';
import '../../api/auth_api.dart';
import '../../models/homepage.dart';

class ProfilAkademikSection extends StatefulWidget {
  const ProfilAkademikSection({Key? key}) : super(key: key);

  @override
  _ProfilAkademikSectionState createState() => _ProfilAkademikSectionState();
}

class _ProfilAkademikSectionState extends State<ProfilAkademikSection> {
  late Future<HomePage?> _homePageFuture;

  @override
  void initState() {
    super.initState();
    _homePageFuture = AuthApi.getHomePage();
  }

  Future<void> _refreshHomePage() async {
    setState(() {
      _homePageFuture = AuthApi.getHomePage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshHomePage,
      child: FutureBuilder<HomePage?>(
        future: _homePageFuture,
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
            final header = snapshot.data!;
            return _buildProfilAkademik(context, header);
          } else {
            return Center(
              child: Text('No data available'),
            );
          }
        },
      ),
    );
  }

  Widget _buildProfilAkademik(BuildContext context, HomePage header) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              jenjangAkademik(header.programStudi.programStudi),
              SizedBox(height: screenHeight * 0.01),
              dosenWali(header.dosenWali.dosenWali),
              SizedBox(height: screenHeight * 0.01),
              dosenPembimbing(header.dosenPembimbing.dosenPembimbing),
            ],
          ),
        ),
      ),
    );
  }
}

Widget jenjangAkademik(String programStudi) {
  String capitalizeEachWord(String text) {
    List<String> words = text.split(' ');
    for (int i = 0; i < words.length; i++) {
      if (words[i].isNotEmpty) {
        words[i] =
            words[i][0].toUpperCase() + words[i].substring(1).toLowerCase();
      }
    }
    return words.join(' ');
  }

  final program = capitalizeEachWord(programStudi);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Jenjang Akademik',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
      ),
      SizedBox(height: 5),
      Text(
        '${program}',
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

Widget dosenWali(String dosenWali) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Dosen Wali',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
      ),
      SizedBox(height: 5),
      Text(
        '${dosenWali}',
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

Widget dosenPembimbing(String dosenPembimbing) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Dosen Pembimbing',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
      ),
      SizedBox(height: 5),
      Text(
        dosenPembimbing ?? '-',
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
