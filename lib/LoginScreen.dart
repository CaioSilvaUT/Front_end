import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'UserRegistrationScreen.dart';
import 'HomeScreen.dart';
import 'dart:convert';

class UserLoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  String? authToken;

  Future<void> loginUser(BuildContext context) async {
    String email = emailController.text;
    String senha = senhaController.text;
    String url = 'http://localhost:3000/login_usuario';

    try {
      String jsonData = jsonEncode({
        'email': email,
        'senha': senha,
      });

      var response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonData,
      );

      if (response.statusCode == 200) {
        print('Usuário autenticado com sucesso!');
        var data = jsonDecode(response.body);
        authToken = data['token'];
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen(authToken: authToken
          )),
        );

      } else {
        print('Erro ao autenticar usuário: ${response.body}');
      }
    } catch (e) {
      print('Erro ao conectar ao servidor: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login de Usuário'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: senhaController,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => loginUser(context),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.grey[300]!), 
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)), 
                  ),
                ),
                child: Text('Login'),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserRegistrationScreen()),
                  );
                },
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.grey[800]!), 
                ),
                child: Text('Crie uma conta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
