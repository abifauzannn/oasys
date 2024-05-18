import 'package:flutter/material.dart';
import 'screen2.dart';

class InformationListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Information'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Information ${index + 1}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InformationDetailPage(
                    informationTitle: 'Information ${index + 1}',
                    informationContent: 'Detail informasi ${index + 1}',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
