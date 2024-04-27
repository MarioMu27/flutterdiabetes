import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:xd/models/expedientesmodel.dart';
import 'package:xd/inicio.dart';

// Assuming you have a login model class (loginmodel.dart)
// This is just an example structure, modify it based on your actual model
class LoginModel {
  final String email;
  final String password;

  LoginModel({required this.email, required this.password});

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Diabetes",
      home: LoginInicio(),
    );
  }
}

class LoginInicio extends StatefulWidget {
  @override
  _LoginInicioState createState() => _LoginInicioState();
}

class _LoginInicioState extends State<LoginInicio> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _userId;

  Future<void> _loginUser() async {
    if (_formKey.currentState!.validate()) {
      // Get email and password from controllers
      final String email = _emailController.text;
      final String password = _passwordController.text;

      // Create a LoginModel object with user input
      final LoginModel loginModel =
          LoginModel(email: email, password: password);

      // Encode login model to JSON for sending in the request body
      final String jsonData = jsonEncode(loginModel.toJson());

      try {
        // Replace 'http://100.64.196.59:3000/' with your actual API endpoint
        final response = await http.post(
          Uri.parse('http://100.64.196.59:3000/auth/loginPacientes'),
          headers: {'Content-Type': 'application/json'},
          body: jsonData,
        );

        if (response.statusCode == 200) {
          // Handle successful login
          print('Login successful!');

          // Parse the response body to extract the ID (assuming it's in JSON format)
          final responseData = jsonDecode(response.body);
          _userId = responseData[
              'id']; // Replace 'id' with the actual key in your response

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ExpedienteView(expedientes, userId: _userId)),
          );
        } else {
          // Handle failed login
          print('Login failed: ${response.statusCode}');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error al iniciar sesión'),
            ),
          );
        }
      } catch (error) {
        print(error);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error de red'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicio de Sesión"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Correo electrónico'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese un correo electrónico';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Contraseña'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese una contraseña';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: _loginUser,
                  child: Text('Iniciar sesión'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
