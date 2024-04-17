import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ActivityRegistrationScreen extends StatelessWidget {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  Future<void> registerActivity(BuildContext context) async {
    String nome = nomeController.text;
    String descricao = descController.text;

    String url = 'http://localhost:3000/cadastrar_atividade';

    try {
      String jsonData = jsonEncode({
        'nome': nome,
        'descricao': descricao,
      });
      var response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonData,
      );

      if (response.statusCode == 200) {
        // Cadastro bem-sucedido

      } else {
        print('Erro ao cadastrar atividade: ${response.body}');
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: nomeController,
                decoration: InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: descController,
                decoration: InputDecoration(
                  labelText: 'Descrição',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => registerActivity(context),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.grey[300]!),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                child: Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
