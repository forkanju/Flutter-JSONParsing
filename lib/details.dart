import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget{
    var receivedData;
    DetailsPage({this.receivedData});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircleAvatar(
          radius: 100,
          child: Image.network(receivedData["avatar"]),
        ),
      ),
    );
  }
}