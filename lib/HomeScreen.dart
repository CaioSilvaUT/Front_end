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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserRegistrationScreen()),
                );
              },
              child: Text('Cadastro de Usuário'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ActivityRegistrationScreen()),
                );
              },
              child: Text('Cadastro de Atividade'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeliveryRegistrationScreen()),
                );
              },
              child: Text('Cadastro de Entrega'),
            ),
          ],
        ),
      ),
    );
  }
}
