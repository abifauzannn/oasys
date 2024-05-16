import 'package:flutter/material.dart';
import 'package:oasys/api/auth_api.dart';
import 'package:oasys/models/user.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({Key? key}) : super(key: key);

  @override
  _HeaderSectionState createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  late Future<UserProfile?> _userProfileFuture;

  @override
  void initState() {
    super.initState();
    _userProfileFuture = AuthApi.getProfile();
  }

  Future<void> _refreshProfile() async {
    setState(() {
      _userProfileFuture = AuthApi.getProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshProfile,
      child: FutureBuilder<UserProfile?>(
        future: _userProfileFuture,
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
            final userProfile = snapshot.data!;
            return _buildUserProfile(context, userProfile);
          } else {
            return Center(
              child: Text('No data available'),
            );
          }
        },
      ),
    );
  }

  Widget _buildUserProfile(BuildContext context, UserProfile userProfile) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: screenWidth / 6,
            height: screenWidth / 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                userProfile.photoNew,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                userProfile.name,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: screenHeight * 0.003),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/award.png'),
                    width: screenWidth * 0.05,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  Text(
                    'NIM: ${userProfile.nim}',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Colors.blue[600],
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.003),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/star.png'),
                    width: screenWidth * 0.05,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  Text(
                    'IF - 901',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Colors.purple[300],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
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
    List<String> nameWords = name.split(' ');
    String firstName = nameWords.isNotEmpty ? nameWords.first : '';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ImageUser(),
        SizedBox(width: 10),
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
