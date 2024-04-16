import 'package:flutter/material.dart';
import 'UserRegistrationScreen.dart';
import 'ActivityRegistrationScreen.dart';
import 'DeliveryRegistrationScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserRegistrationScreen()),
                );
              },
              child: Text('Cadastro de Usuário'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ActivityRegistrationScreen()),
                );
              },
              child: Text('Cadastro de Atividade'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeliveryRegistrationScreen()),
                );
              },
              child: Text('Cadastro de Entrega'),
            ),
          ),
        ],
      ),
    );
  }
}
