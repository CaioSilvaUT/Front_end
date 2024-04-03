import 'package:flutter/material.dart';

class UserRegistrationScreen extends StatelessWidget {
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
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implementar lógica de cadastro de usuário
              },
              child: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
