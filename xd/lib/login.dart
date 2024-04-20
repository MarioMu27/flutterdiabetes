
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:xd/inicio.dart';

// Assuming you have a login model class (loginmodel.dart)
// This is just an example structure, modify it based on your actual model
class LoginModel {
  final String email;
  final String password;

  LoginModel({required this.email, required this.password});

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}

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

class LoginInicio extends StatefulWidget {
  const LoginInicio({Key? key}) : super(key: key);

  @override
  _LoginInicioState createState() => _LoginInicioState();
}

class _LoginInicioState extends State<LoginInicio> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _loginUser() async {
    if (_formKey.currentState!.validate()) {
      // Get email and password from controllers
      String email = _emailController.text;
      String password = _passwordController.text;

      // Create a LoginModel object with user input
      LoginModel loginModel = LoginModel(email: email, password: password);

      // Encode login model to JSON for sending in the request body
      String jsonData = jsonEncode(loginModel.toJson());

      try {
        // Replace 'http://100.64.196.59:3000/' with your actual API endpoint
        final response = await http.post(
          Uri.parse('http://100.68.51.19:3000/auth/login'),
          
          headers: {'Content-Type': 'application/json'},
          body: jsonData,
        );
        

        if (response.statusCode == 200) {
          // Handle successful login (navigate to another screen, etc.)
          print('Login successful!');
          
           Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => pagInicio()),
    );
        }
         else {
          // Handle failed login (show error message)
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
  void initState() {
    super.initState();
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