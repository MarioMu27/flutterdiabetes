import 'package:flutter/material.dart';
import 'package:xd/login.dart';


void main() => runApp(Diabetes());

class Diabetes extends StatelessWidget {
  const Diabetes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Control De Diabetes",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: inter(context),
    );
  }
}

Widget inter(BuildContext context) { // Añade el parámetro context
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage("https://st2.depositphotos.com/36924814/46071/i/450/depositphotos_460713580-stock-photo-medical-health-blue-cross-neon.jpg"),
        fit: BoxFit.cover,
      ),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          bienvenida(),
          initSesion(context), // Llama a la función initSesion() pasando el contexto
        ],
      ),
    ),
  );
}

Widget bienvenida() {
  return Text(
    "Bienvenido",
    textAlign: TextAlign.center,
    style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
  );
}

Widget initSesion(BuildContext context) { // Añade el parámetro context
  return ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginApp()),
      );
    },
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.add),
        ),
        Text('Iniciar Sesión'),
      ],
    ),
  );
}
