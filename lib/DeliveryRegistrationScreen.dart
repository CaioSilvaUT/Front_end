import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';

class DeliveryRegistrationScreen extends StatelessWidget {
  final String? authToken;
  final Map<String, dynamic> activity;
  final TextEditingController notaController = TextEditingController(); 

  DeliveryRegistrationScreen({required this.activity, Key? key, this.authToken}) : super(key: key);

  Future<void> deliverActivity(BuildContext context) async {
    try {
      if (authToken == null) {
        throw Exception('Token de autenticação ausente.');
      }

      final Map<String, dynamic> decodedToken = Jwt.parseJwt(authToken!);
      final int userId = decodedToken['userId'];

      final double notaEntrega = double.parse(notaController.text);

      final response = await http.post(
        Uri.parse('http://localhost:3000/cadastrar_entrega'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $authToken',
        },
        body: jsonEncode(<String, dynamic>{
          'userId': userId,
          'atividadeId': activity['id'],
          'notaEntrega': notaEntrega,
        }),
      );

      if (response.statusCode == 200) {
        Navigator.pop(context, true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Erro ao entregar atividade'),
        ));
      }
    } catch (e) {
      print('Erro ao entregar atividade: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Erro ao entregar atividade'),
      ));
    }
  }

  @override
Widget build(BuildContext context) {
  print('Token: $authToken');

  return Scaffold(
    appBar: AppBar(
      title: Text('Entrega de Atividade'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Atividade: ${activity['nome']}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            'Descrição: ${activity['descricao']}',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: notaController,
            decoration: InputDecoration(
              labelText: 'Nota da entrega',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.numberWithOptions(decimal: true), 
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => deliverActivity(context),
            child: Text('Entregar Atividade'),
          ),
        ],
      ),
    ),
  );
}
}
