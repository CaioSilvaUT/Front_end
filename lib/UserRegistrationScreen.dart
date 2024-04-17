import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserRegistrationScreen extends StatelessWidget {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController(); // Adicionar controller para a senha

  Future<void> registerUser() async {
    String nome = nomeController.text;
    String email = emailController.text;
    String senha = senhaController.text; // Obter senha do controller

    // URL da sua rota de API para cadastrar usuários
    String url = 'http://localhost:3000/cadastrar_usuario';
;

    try {
    // Converta os dados para JSON usando jsonEncode
    String jsonData = jsonEncode({
      'nome': nome,
      'email': email,
      'senha': senha,
    });

    // Faça uma solicitação POST para o servidor com os dados do novo usuário
    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8', // Especifique o tipo de conteúdo como JSON
      },
      body: jsonData, // Envie os dados JSON no corpo da solicitação
    );

      if (response.statusCode == 200) {
        // Cadastro bem-sucedido
        print('Usuário cadastrado com sucesso!');
      } else {
        // Trate erros ou falhas de cadastro
        print('Erro ao cadastrar usuário: ${response.body}');
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
        title: Text('Cadastro de Usuário'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: senhaController,
              decoration: InputDecoration(labelText: 'Senha'), // Adicionar campo para a senha
              obscureText: true, // Ocultar a senha
            ),
            ElevatedButton(
              onPressed: registerUser,
              child: Text('Cadastrar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserLoginScreen()),
                );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
