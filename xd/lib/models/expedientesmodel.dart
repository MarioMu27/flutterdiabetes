// Clase para representar un expediente
class Expediente {
  final int idExpediente;
  final DateTime fecha;
  final String estado;

  Expediente({
    required this.idExpediente,
    required this.fecha,
    required this.estado,
  });

  factory Expediente.fromJson(Map<String, dynamic> json) {
    return Expediente(
      idExpediente: json['ID_EXPEDIENTE'] as int,
      fecha: DateTime.parse(json['FECHA']),
      estado: json['ESTADO'] as String,
    );
  }
}
