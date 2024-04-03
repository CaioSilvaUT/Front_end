import 'package:flutter/material.dart';

class DeliveryRegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Entrega'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Implementar campos de seleção de usuário e entrega
            ElevatedButton(
              onPressed: () {
                // Implementar lógica de cadastro de entrega
              },
              child: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
