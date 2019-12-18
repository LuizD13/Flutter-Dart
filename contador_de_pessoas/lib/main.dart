import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    //Função para invocar o App
      title: 'Contador de pessoas', //Só interno, não serve para nada
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _infotext = "Pode entrar!";
  int _people = 0;

  void _changePeople(int delta) {
    setState(() {
      _people += delta;

      if (_people < 0) {
        _infotext = "Mundo invertido?!";
      } else if (_people <= 10) {
        _infotext = "Pode entrar!!";
      } else {
        _infotext = "Não temos mais lugar!!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
            "images/restaurant.jpg",
            fit: BoxFit.cover,
            height: 1000.0
          //
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment
              .center, //Widget de coluna - Alinhado para o centro da tela
          children: <Widget>[
            Text(
              "Pessoas: $_people",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text("+1",
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                        )),
                    onPressed: () {
                      _changePeople(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text("-1",
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                        )),
                    onPressed: () {
                      _changePeople(-1);
                    },
                  ),
                ),
              ],
            ),
            Text("$_infotext",
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 21))
          ],
        )
      ],
    );
  }
}
