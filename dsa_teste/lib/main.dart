import 'dart:convert';

import "package:flutter/material.dart";
import "package:http/http.dart" as http;

const request =
    'http://192.168.0.147:211/datasnap/rest/TServerMethods1/GetClientes';

void main() {
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Teste DSA"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                  child: Text(
                "Carregando dados...",
                style: TextStyle(color: Colors.black, fontSize: 25),
                textAlign: TextAlign.center,
              ));
            default:
              if (snapshot.hasError) {
                print(snapshot.error);
                return Center(
                    child: Text('Erro ao carregar dados: ' + snapshot.error,
                        style: TextStyle(color: Colors.black, fontSize: 25)));
              } else {
                return Container(
                  color: Colors.white,
                  child: Text(
                    snapshot.data["result"][0]["nome"],
                    style: TextStyle(fontSize: 25),
                  ),
                  alignment: Alignment.center,
                );
              }
          }
        },
      ),
    );
  }
}

Future<Map> getData() async {
  http.Response response = await http.get(request);
  return json.decode(response.body);
}




