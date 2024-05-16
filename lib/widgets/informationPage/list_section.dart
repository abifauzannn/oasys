import 'package:flutter/material.dart';
import 'package:oasys/widgets/informationPage/detail_section.dart';
import 'package:oasys/models/pengumuman.dart';
import 'package:oasys/api/auth_api.dart';

class ListInformation extends StatefulWidget {
  const ListInformation({Key? key}) : super(key: key);

  @override
  _ListInformationState createState() => _ListInformationState();
}

class _ListInformationState extends State<ListInformation> {
  late Future<List<PengumumanDetail>> _pengumumanListFuture;

  @override
  void initState() {
    super.initState();
    _pengumumanListFuture = AuthApi.getPengumuman();
  }

  Future<void> _refreshPengumumanList() async {
    setState(() {
      _pengumumanListFuture = AuthApi.getPengumuman();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PengumumanDetail>>(
      future: _pengumumanListFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          final pengumumanList = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              children: pengumumanList.map((pengumumanDetail) {
                return InformationCard(pengumumanDetail: pengumumanDetail);
              }).toList(),
            ),
          );
        } else {
          return Center(
            child: Text('No data available'),
          );
        }
      },
    );
  }
}

class InformationCard extends StatelessWidget {
  const InformationCard({Key? key, required this.pengumumanDetail})
      : super(key: key);

  final PengumumanDetail pengumumanDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AboutInformation(pengumumanDetail: pengumumanDetail),
              ),
              CustomIcon(pengumumanDetail: pengumumanDetail),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key, required this.pengumumanDetail})
      : super(key: key);

  final PengumumanDetail pengumumanDetail;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailInformation(pengumumanDetail: pengumumanDetail)),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.black.withOpacity(0.3),
          ),
        ),
      ),
    );
  }
}

class AboutInformation extends StatelessWidget {
  const AboutInformation({Key? key, required this.pengumumanDetail})
      : super(key: key);

  final PengumumanDetail pengumumanDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          pengumumanDetail.judul,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        Text(
          pengumumanDetail.date,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
