import 'package:flutter/material.dart';

class PaginaSobreJogos extends StatefulWidget {
  @override
  _PaginaSobreJogosState createState() => _PaginaSobreJogosState();
}

class _PaginaSobreJogosState extends State<PaginaSobreJogos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre os jogos"),
      ),
      body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Text(
                'Este app possui alguns jogos incríveis !\n',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.indigo[700],
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '1- Jogo do adivinha : ',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.pink[500],
                    fontWeight: FontWeight.bold),
              ),
              Text(
                  '\nAdivinhe um número aleatório entre 0 e 50 usando o mínimo de tentativas possíveis',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.indigo[700],
                      fontWeight: FontWeight.normal)),
              Text(
                '\n2- Jogo do Tempo : ',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.pink[500],
                    fontWeight: FontWeight.bold),
              ),
              Text(
                  '\nTeste seus connhecimentos matemáticos e resolva o máximo de equações matemáticas',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.indigo[700],
                      fontWeight: FontWeight.normal)),
            ],
          )),
    );
  }
}
