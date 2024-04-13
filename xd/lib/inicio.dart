import 'package:flutter/material.dart';
import 'package:xd/medicamentos.dart'; // Replace with your actual path

void main() => runApp(pagInicio());

class pagInicio extends StatelessWidget {
  const pagInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Diabetes Control",
      theme: ThemeData(
        fontFamily: 'OpenSans', // Consider using a diabetes-friendly font
        primaryColor: Colors.blueAccent[400], // Or a gentler color scheme
      ),
      home: PagePrin(),
      routes: {
        '/medicamentos': (context) => PlantillaMedicamentos(),
      }, // Add the route for medicamentos
    );
  }
}

class PagePrin extends StatelessWidget {
  const PagePrin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Controla tu diabetes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Feature 1: Blood glucose tracking
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.bloodtype),
                title: Text("Registra glucosa"),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigator.push(...) to blood glucose tracking screen
                },
              ),
            ),
            // Feature 2: Medication reminders
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.medical_services),
                title: Text("Medicamentos"),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.pushNamed(context, '/medicamentos'); // Use named route
                },
              ),
            ),
            // Feature 3: Food logging and nutrition
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.restaurant),
                title: Text("Alimentación"),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigator.push(...) to food logging and nutrition screen
                },
              ),
            ),
            // Feature 4: Educational resources
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.book),
                title: Text("Aprende sobre diabetes"),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigator.push(...) to resources screen
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
