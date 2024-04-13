import 'package:flutter/material.dart';
import 'package:xd/models/loginmodel.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';
void main() => runApp(LoginApp());

class LoginApp extends StatelessWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Diabetes",
      home: LoginInicio(),
    );
  }
}

class LoginInicio extends StatelessWidget {
  const LoginInicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicio de Sesión"),
      ),
      body: cuerpo(),
    );
  }
}

Widget cuerpo() {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage("https://png.pngtree.com/background/20210711/original/pngtree-health-medical-hospital-medicine-blue-banner-advertisement-picture-image_1107360.jpg"),
        fit: BoxFit.cover,
      ),
    ),
    child: Center(
      child: Text(
        "Iniciar Sesión",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

//HOLA
