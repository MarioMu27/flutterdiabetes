import 'package:flutter/material.dart';


class PlantillaMedicamentos extends StatefulWidget {
  const PlantillaMedicamentos({super.key});

  @override
  State<PlantillaMedicamentos> createState() => _PlantillaMedicamentosState();
}

class _PlantillaMedicamentosState extends State<PlantillaMedicamentos> {
  final TextEditingController _nombreMedicamentoController = TextEditingController();
  final TextEditingController _dosisMedicamentoController = TextEditingController();
  final TextEditingController _frecuenciaMedicamentoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agregar Medicamento"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _nombreMedicamentoController,
              decoration: InputDecoration(labelText: "Nombre del Medicamento"),
            ),
            TextField(
              controller: _dosisMedicamentoController,
              decoration: InputDecoration(labelText: "Dosis"),
            ),
            TextField(
              controller: _frecuenciaMedicamentoController,
              decoration: InputDecoration(labelText: "Frecuencia"),
            ),
            ElevatedButton(
              onPressed: () {
                // Guardar la información del medicamento
                Navigator.pop(context);
              },
              child: Text("Agregar"),
            ),
          ],
        ),
      ),
    );
  }
}
