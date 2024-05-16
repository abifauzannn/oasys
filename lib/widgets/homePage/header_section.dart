import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../api/auth_api.dart';
import '../../models/homepage.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({Key? key}) : super(key: key);

  @override
  _HeaderSectionState createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
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
            return _buildHeader(context, header);
          } else {
            return Center(
              child: Text('No data available'),
            );
          }
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context, HomePage header) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.all(0.0),
      child: Column(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight / 14,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NameAndNim(
                    name: header.infoMahasiswa.nama,
                    nim: header.infoMahasiswa.nim,
                  ),
                  CalendarImage(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CalendarImage extends StatelessWidget {
  const CalendarImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/calendar.svg',
      width: 32,
      height: 32,
      fit: BoxFit.cover,
    );
  }
}

class ImageUser extends StatelessWidget {
  const ImageUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        image: DecorationImage(
          image: AssetImage('assets/images/oasys-logo.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class NameAndNim extends StatelessWidget {
  const NameAndNim({Key? key, required this.name, required this.nim})
      : super(key: key);

  final String name;
  final String nim;

  @override
  Widget build(BuildContext context) {
    // Split the name into words
    List<String> nameWords = name.split(' ');
    // Get the first word
    String firstName = nameWords.isNotEmpty ? nameWords.first : '';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ImageUser(), // Display the user image
        SizedBox(width: 10), // Add some space between the image and text
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, $firstName',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'poppins',
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/svg/award.svg',
                  width: 16,
                  height: 16,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 5),
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
            ),
          ],
        ),
      ],
    );
  }
}



