import 'dart:math';
import 'package:flutter/material.dart';

class JogoTempo extends StatefulWidget {
  @override
  _JogoTempoState createState() => _JogoTempoState();
}

class _JogoTempoState extends State<JogoTempo> {
  // VARIAVEIS
  final _tNumero = TextEditingController();
  var _equacaoText = "Aperte enviar para começar";
  var _formKey = GlobalKey<FormState>();
  Random random = new Random();
  int pontos = 0;
  int acertos = 0;
  int erros = 0;
  int numero1 = 0;
  int numero2 = 0;
  String operacao = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jogos"),
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
    pontos = 0;
    acertos = 0;
    erros = 0;
    numero1 = 0;
    numero2 = 0;
    operacao = "";
    setState(() {
      _equacaoText = "Aperte enviar para começar";
      _formKey = GlobalKey<FormState>();
    });
  }

  _body() {
    return SingleChildScrollView(
        padding: EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _textEquacao(),
              _editText("Resposta:", _tNumero),
              _buttonCalcular(),
              _textPontos(),
              _textAcertos(),
              _textErros(),
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
          color: Colors.grey[600],
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
      margin: EdgeInsets.only(top: 30.0, bottom: 20),
      height: 45,
      child: RaisedButton(
        color: Colors.indigo[500],
        child: Text(
          "Enviar",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        onPressed: () {
          _confere();
        },
      ),
    );
  }

  void _confere() {
    setState(() {
      if (_equacaoText == "Aperte enviar para começar")
        _novaEquacao();
      else {
        int resposta = _getResposta();

        if (resposta == int.parse(_tNumero.text)) {
          acertos++;
          if (operacao == "*")
            pontos = pontos + 10;
          else
            pontos = pontos + 5;
        } else
          erros++;
        print(pontos);
        _novaEquacao();
        _tNumero.text = "";
      }
    });
  }

  int _novoNumero(int x) {
    return random.nextInt(x);
  }

  int _getResposta() {
    int resposta;

    switch (operacao) {
      case "+":
        resposta = numero1 + numero2;
        break;
      case "-":
        resposta = numero1 - numero2;
        break;
      case "*":
        resposta = numero1 * numero2;
        break;
      default:
    }

    return resposta;
  }

  void _novaEquacao() {
    int x = _novoNumero(3);

    switch (x) {
      case 0:
        operacao = "+";
        break;
      case 1:
        operacao = "-";
        break;
      case 2:
        operacao = "*";
        break;
      default:
        operacao = "+";
    }

    if (operacao == "*") {
      numero1 = _novoNumero(20) + 1;
      numero2 = _novoNumero(15) + 1;
    } else {
      numero1 = _novoNumero(35) + 1;
      numero2 = _novoNumero(10) + 1;

      if (numero1 < numero2 && operacao == "-") {
        int aux = numero1;
        numero1 = numero2;
        numero2 = aux;
      }
    }

    setState(() {
      _equacaoText = numero1.toString() +
          " " +
          operacao +
          " " +
          numero2.toString() +
          " = ?";
    });
  }

  // // Widget text

  _textEquacao() {
    return Text(
      _equacaoText,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.indigo[500],
          fontSize: 25.0,
          fontWeight: FontWeight.normal),
    );
  }

  _textPontos() {
    return Text(
      "\nPontos:\n " + pontos.toString() + "\n",
      textAlign: TextAlign.left,
      style: TextStyle(
          color: Colors.indigo[700], fontSize: 21, fontWeight: FontWeight.bold),
    );
  }

  _textAcertos() {
    return Text(
      "Acertos:\n " + acertos.toString() + "\n",
      textAlign: TextAlign.left,
      style: TextStyle(
          color: Colors.indigo[500], fontSize: 21, fontWeight: FontWeight.bold),
    );
  }

  _textErros() {
    return Text(
      "Erros:\n " + erros.toString() + "\n",
      textAlign: TextAlign.left,
      style: TextStyle(
          color: Colors.indigo[500], fontSize: 21, fontWeight: FontWeight.bold),
    );
  }
}
