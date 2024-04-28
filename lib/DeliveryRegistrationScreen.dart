import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeliveryRegistrationScreen extends StatelessWidget {

  final String? authToken; // Definindo o parâmetro authToken
  // Adicione o construtor que recebe o authToken
  final Map<String, dynamic> activity;
  DeliveryRegistrationScreen({required this.activity, Key? key, this.authToken}) : super(key: key);

  Future<void> deliverActivity(BuildContext context) async {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
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
