import 'package:flutter/material.dart';

import 'JogoDoAdivinha.dart';
import 'PaginaSobreJogos.dart';
import 'jogoTempo.dart';

class PaginaMeusJogos extends StatefulWidget {
  @override
  _EstadoPaginaMeusJogos createState() => _EstadoPaginaMeusJogos();
}

class _EstadoPaginaMeusJogos extends State<PaginaMeusJogos> {
  @override
  Widget build(BuildContext contexto) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Meus Jogos'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: <Widget>[
            Text(
              'Selecione um \n   dos jogos:',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.indigo[700],
                  fontWeight: FontWeight.bold),
            ),
            _imagemJogoAdivinhacao(contexto),
            _imagemJogoTempo(contexto),
            _imagemSobreApp(contexto),
          ]),
        ),
        padding: EdgeInsets.all(40),
      ),
    );
  }

  _imagemJogoAdivinhacao(BuildContext contexto) {
    return Container(
      child: Column(
        children: <Widget>[
          RaisedButton(
            color: Colors.pink[600],
            child: Text(
              ' JOGO  DA  ADIVINHAÇÃO ',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            onPressed: () {
              Navigator.push(contexto,
                  MaterialPageRoute(builder: (contexto) => JogoDoAdivinha()));
            },
          )
        ],
      ),
      margin: EdgeInsets.only(top: 50.0),
    );
  }

  _imagemJogoTempo(BuildContext contexto) {
    return Container(
      child: Column(
        children: <Widget>[
          RaisedButton(
            color: Colors.blue[300],
            child: Text(
              '        JOGO DO TEMPO       ',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            onPressed: () {
              Navigator.push(contexto,
                  MaterialPageRoute(builder: (contexto) => JogoTempo()));
            },
          ),
        ],
      ),
      margin: EdgeInsets.only(top: 20.0),
    );
  }

  _imagemSobreApp(BuildContext contexto) {
    return Container(
      child: Column(
        children: <Widget>[
          RaisedButton(
            color: Colors.green[600],
            child: Text(
              '        SOBRE OS JOGOS       ',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            onPressed: () {
              Navigator.push(contexto,
                  MaterialPageRoute(builder: (contexto) => PaginaSobreJogos()));
            },
          ),
        ],
      ),
      margin: EdgeInsets.only(top: 20.0),
    );
  }
}
