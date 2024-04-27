import 'package:flutter/material.dart';
import 'package:xd/login.dart'; // Assuming login.dart contains LoginApp

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

Widget inter(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(
          "https://img.freepik.com/vector-premium/patron-medico-fisuras_71374-182.jpg"
        ),
        fit: BoxFit.cover,
      ),
    ),
    child: Center( // Center the entire content
      child: SingleChildScrollView( // Allow for scrolling if content overflows
        child: Padding( // Add padding around the content
          padding: EdgeInsets.all(20.0),
          child: Column(  // Use Column for vertical layout
            mainAxisAlignment: MainAxisAlignment.center, // Center the column
            children: [
              bienvenida(),
              SizedBox(height: 20.0), // Add some space between elements
              initSesion(context),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget bienvenida() {
  return Text(
    "Bienvenido",
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Colors.black,
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget initSesion(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginApp()),
      );
    },
    child: Row(
      mainAxisSize: MainAxisSize.min,  // Adjust width as needed
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
