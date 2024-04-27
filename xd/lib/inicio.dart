import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xd/citas.dart';
import 'package:xd/medicamentos.dart'; // Assuming this is the login page

class ExpedienteView extends StatefulWidget {
  const ExpedienteView(expedientes, {Key? key, required Type Expediente, String? userId}) : super(key: key);

  @override
  _ExpedienteViewState createState() => _ExpedienteViewState();
}

class _ExpedienteViewState extends State<ExpedienteView> {
  // Add state variables to store retrieved records and handle errors
  List<dynamic> expedientes = [];
  bool isLoading = false;
  String? errorMessage;
  
  get http => null;

  @override
  void initState() {
    super.initState();
    _fetchExpedientes();
  }

  Future<void> _fetchExpedientes() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      // Call the obtenerExpedientePorId function with user ID (implementation needed)
      final response = await http.post(
        Uri.parse('http://100.64.196.59:3000/expediente/obtenerExpedientePorId'),
        body: {'id':},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          expedientes = data['expedientes'];
        });
      } else {
        setState(() {
          errorMessage = 'Error al obtener expedientes';
        });
      }
    } catch (error) {
      setState(() {
        errorMessage = 'Error de red';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Expedientes del Paciente'),
    ),
    body: isLoading
        ? Center(child: CircularProgressIndicator())
        : errorMessage != null
            ? Center(child: Text(errorMessage!))
            : ListView.builder(
                itemCount: expedientes.length,
                itemBuilder: (context, index) {
                  final expediente = expedientes[index];
                  // Extract data from each record (e.g., fecha, estado, nombres del paciente y usuario)
                  return ListTile(
                    title: Text(expediente['FECHA']),
                    subtitle: Text(expediente['ESTADO']),
                    trailing: Text('${expediente['NOMBRES_PACIENTE']} ${expediente['APELLIDOS_PACIENTE']}'),
                  );
                },
              ),
  );
}

}



