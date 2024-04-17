import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'UserRegistrationScreen.dart';
import 'HomeScreen.dart';
import 'dart:convert';

class UserLoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  String? authToken; // Variável para armazenar o token de autenticação

  Future<void> loginUser(BuildContext context) async {
    String email = emailController.text;
    String senha = senhaController.text;

    // URL da sua rota de API para o login de usuários
    String url = 'http://localhost:3000/login_usuario';

    try {
      // Converta os dados para JSON usando jsonEncode
      String jsonData = jsonEncode({
        'email': email,
        'senha': senha,
      });

      // Faça uma solicitação POST para o servidor com os dados de login do usuário
      var response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonData,
      );

      if (response.statusCode == 200) {
        // Login bem-sucedido
        print('Usuário autenticado com sucesso!');
        // Obtenha o token do corpo da resposta
        var data = jsonDecode(response.body);
        authToken = data['token'];

        // Navegar para a próxima tela do aplicativo após o login bem-sucedido
        Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => HomeScreen()),
);


      } else {
        // Trate erros ou falhas de login
        print('Erro ao autenticar usuário: ${response.body}');
      }
    } catch (e) {
      // Trate erros de conexão ou outras exceções
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: senhaController,
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () => loginUser(context),
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserRegistrationScreen()),
                );
              },
              child: Text('Crie uma conta'),
            ),
          ],
        ),
      ),
    );
  }
}
