import 'dart:convert';

import "package:flutter/material.dart";
import "package:http/http.dart" as http;

const request =
    'http://192.168.1.156:211/datasnap/rest/TServerMethods1/GetClientes';

void main(){
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(

  );
  }
}

Future<Map> getData() async {
  http.Response response = await http.get(request);
  return json.decode(response.body);
}