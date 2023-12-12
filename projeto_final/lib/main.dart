import 'package:flutter/material.dart';
import 'package:projeto_final/screens/login.dart';

void main() {
  runApp(MaterialApp(
    title: 'Teste',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.grey),
    home: const Login(),
  ));
}
