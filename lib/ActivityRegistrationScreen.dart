import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ActivityRegistrationScreen extends StatelessWidget {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  Future<void> registerActivity() async {
    String nome = nomeController.text;
    String descricao = descController.text;

    String url = 'http://localhost:3000/cadastrar_atividade';
;

    try {
    String jsonData = jsonEncode({
      'nome': nome,
      'descricao': descricao
    });
    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8', 
      },
      body: jsonData
    );

      if (response.statusCode == 200) {
        // Cadastro bem-sucedido

      } else {
        print('Erro ao cadastrar usuário: ${response.body}');
      }
    } catch (e) {
      print('Erro ao conectar ao servidor: $e');
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Atividade'),
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
              controller: descController,
              decoration: InputDecoration(labelText: 'Descrição'),
            ),
            ElevatedButton(
              onPressed: registerActivity,
              child: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
