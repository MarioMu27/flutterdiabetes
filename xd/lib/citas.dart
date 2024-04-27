import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class CitasPage extends StatefulWidget {
  @override
  _CitasPageState createState() => _CitasPageState();
}

class _CitasPageState extends State<CitasPage> {
  String token = ''; // Reemplazar con el token de autenticación real
  List<dynamic> citas = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getCitas(); // Cargar citas al iniciar la página
  }

  Future<void> _getCitas() async {
    setState(() {
      isLoading = true;
      citas = [];
    });

    final response = await http.post(
      Uri.parse(
          'http://100.64.196.59:3000/cargoCitas/getCita'), // Reemplazar con el ID real de la cita
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        isLoading = false;
        citas = data['results'];
      });
    } else {
      // Manejar errores
      print('Error al obtener citas: ${response.statusCode}');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis citas'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: citas.length,
              itemBuilder: (context, index) {
                final cita = citas[index];
                // Mostrar la información de la cita (ej: fecha, hora, descripción)
                return ListTile(
                  title: Text('Cita ${index + 1}'),
                  subtitle: Text(
                      'Fecha: ${cita['FECHA']} Expediente: ${cita['ID_EXPEDIENTE']}'),
                  onTap: () {
                    // Navegar a la vista de detalles de la cita (opcional)
                  },
                );
              },
            ),
    );
  }
}
