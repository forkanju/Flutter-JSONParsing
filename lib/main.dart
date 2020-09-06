import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_parsing/details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Date And Time Picker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var data;
  Future getData() async {
    var response = await http.get("https://reqres.in/api/users?page=2");
    setState(() {
      var decode = json.decode(response.body);
      data = decode["data"];
      print(data);

    });

  }

  @override
  initState(){
    super.initState();
    this.getData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemCount: data == null ? 0: data.length,
      itemBuilder: (context, index){
         return ListTile(
           title: Text(data[index]["first_name"]),
           subtitle: Text(data[index]["email"]),
           onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(receivedData: data[index],)));
           },
         );
      },),
    );
  }
}
