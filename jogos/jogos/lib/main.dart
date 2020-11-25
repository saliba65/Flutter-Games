import 'package:flutter/material.dart';

import 'pages/PaginaLogin.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.indigo,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.amber[200],
    ),
    home: PaginaLogin(),
  ));
}
