import 'package:flutter/material.dart';

class ActivityRegistrationScreen extends StatelessWidget {
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
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Descrição'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implementar lógica de cadastro de atividade
              },
              child: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
