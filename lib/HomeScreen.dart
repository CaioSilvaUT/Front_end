import 'package:flutter/material.dart';
import 'ActivityRegistrationScreen.dart';
import 'ActivityShowScreen.dart';

class HomeScreen extends StatelessWidget {
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
                  MaterialPageRoute(builder: (context) => ActivityShowScreen()),
                );
              },
              child: Text('Visualizar Atividades'),
            ),
          ),
        ],
      ),
    );
  }
}
