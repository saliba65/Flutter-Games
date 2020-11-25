import 'dart:math';

import 'package:flutter/material.dart';

class JogoDoAdivinha extends StatefulWidget {
  @override
  _JogoDoAdivinhaState createState() => _JogoDoAdivinhaState();
}

class _JogoDoAdivinhaState extends State<JogoDoAdivinha> {
  // VARIAVEIS
  final _tNumero = TextEditingController();
  var _infoText = "Adivinhe o número !";
  var _formKey = GlobalKey<FormState>();
  Random random = new Random();
  int numero;
  int tentativas = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jogo do Adivinha"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: _resetFields)
        ],
      ),
      body: _body(),
    );
  }

  // PROCEDIMENTO PARA LIMPAR OS CAMPOS
  void _resetFields() {
    _tNumero.text = "";
    numero = _novoNumero();
    tentativas = 0;
    setState(() {
      _infoText = "Adivinhe o número ";
      _formKey = GlobalKey<FormState>();
    });
  }

  _body() {
    return SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _editText("Número", _tNumero),
              _buttonCalcular(),
              _textInfo(),
            ],
          ),
        ));
  }

  // Widget text
  _editText(String field, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      validator: (s) => _validate(s, field),
      keyboardType: TextInputType.number,
      style: TextStyle(
        fontSize: 22,
        color: Colors.indigo[500],
      ),
      decoration: InputDecoration(
        labelText: field,
        labelStyle: TextStyle(
          fontSize: 22,
          color: Colors.indigo[700],
        ),
      ),
    );
  }

  // PROCEDIMENTO PARA VALIDAR OS CAMPOS
  String _validate(String text, String field) {
    if (text.isEmpty) {
      return "Digite $field";
    }
    return null;
  }

  // Widget button
  _buttonCalcular() {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 20),
      height: 45,
      child: RaisedButton(
        color: Colors.indigo[500],
        child: Text(
          "Conferir",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _confere();
          }
        },
      ),
    );
  }

  void _confere() {
    if (numero == null) numero = _novoNumero();
    setState(() {
      if (int.parse(_tNumero.text) == numero) {
        _infoText = "Parabéns ! \n\n Você adivinhou em  " +
            tentativas.toString() +
            " tentativas !\n\n Jogue novamente !";
        numero = _novoNumero();
        tentativas = 0;
      } else {
        tentativas++;

        if (int.parse(_tNumero.text) > 50 || int.parse(_tNumero.text) > 50) {
          _infoText = "O número está entre 0 e 50!";
        } else if (int.parse(_tNumero.text) > numero) {
          _infoText = "Tente um número menor que " + _tNumero.text + "!";
        } else {
          _infoText = "Tente um número maior que " + _tNumero.text + "!";
        }
      }
    });
  }

  int _novoNumero() {
    return random.nextInt(51);
  }

  // // Widget text
  _textInfo() {
    return Text(
      _infoText,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.indigo[700], fontSize: 25.0),
    );
  }
}
