import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListaMedicamentos extends StatefulWidget {
  final int idExpediente;

  const ListaMedicamentos({super.key, required this.idExpediente});

  @override
  State<ListaMedicamentos> createState() => _ListaMedicamentosState();
}

class _ListaMedicamentosState extends State<ListaMedicamentos> {
  Future<List<Medicamento>> _obtenerMedicamentos() async {
    // Use http.get instead of http.post
    final response = await http.get(
      Uri.parse('http://100.64.196.59:3000/medicamentos/expediente/4'),
    );

    if (response.statusCode == 200) {
      final medicamentosJson = jsonDecode(response.body) as List<dynamic>;
      return medicamentosJson.map((m) => Medicamento.fromJson(m)).toList();
    } else {
      throw Exception('Error al obtener medicamentos: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Medicamento>>(
      future: _obtenerMedicamentos(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final medicamentos = snapshot.data!;
          return ListView.builder(
            itemCount: medicamentos.length,
            itemBuilder: (context, index) {
              final medicamento = medicamentos[index];
              return ListTile(
                title: Text(medicamento.nombre),
                subtitle: Text('Dosis: ${medicamento.dosis}'),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class Medicamento {
  final int id;
  final String nombre;
  final String dosis;

  Medicamento({
    required this.id,
    required this.nombre,
    required this.dosis,
  });

  factory Medicamento.fromJson(Map<String, dynamic> json) {
    return Medicamento(
      id: json['ID_EXPEDIENTE'] as int,
      nombre: json['NOMBRE_MEDICAMENTO'] as String,
      dosis: json['NO_DIAS'] as String,
    );
  }
}
