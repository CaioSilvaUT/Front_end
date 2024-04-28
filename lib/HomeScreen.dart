import 'package:flutter/material.dart';
import 'ActivityRegistrationScreen.dart';
import 'ActivityShowScreen.dart';
import 'LoginScreen.dart'; 
import 'package:jwt_decode/jwt_decode.dart';

class HomeScreen extends StatelessWidget {
  final String? authToken;

  const HomeScreen({Key? key, this.authToken}) : super(key: key);

  // Função para verificar se o token está expirado
  bool get isTokenExpired {
    if (authToken == null) {
      return true; // Se o token não estiver presente, consideramos como expirado
    }

    return Jwt.isExpired(authToken!);
  }

  // Função para lidar com a navegação com base na validade do token
  void navigateToActivityRegistration(BuildContext context) {
    if (!isTokenExpired) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ActivityRegistrationScreen(authToken: authToken)),
      );
    } else {
      // Mostrar mensagem de erro e redirecionar para a tela de login
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erro de Autenticação'),
          content: Text('Você precisa estar logado para acessar esta funcionalidade.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Fechar o diálogo
              child: Text('OK'),
            ),
          ],
        ),
      );
      // Redirecionar para a tela de login após fechar o diálogo
      Future.delayed(Duration(milliseconds: 1500), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => UserLoginScreen()),
        );
      });
    }
  }

  void navigateToActivityShow(BuildContext context) {
    if (!isTokenExpired) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ActivityShowScreen(authToken: authToken)),
      );
    } else {
      // Mostrar mensagem de erro e redirecionar para a tela de login
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erro de Autenticação'),
          content: Text('Você precisa estar logado para acessar esta funcionalidade.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Fechar o diálogo
              child: Text('OK'),
            ),
          ],
        ),
      );
      // Redirecionar para a tela de login após fechar o diálogo
      Future.delayed(Duration(milliseconds: 1500), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => UserLoginScreen()),
        );
      });
    }
  }

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
              onPressed: () => navigateToActivityRegistration(context),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.grey[300],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Cadastro de Atividade',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => navigateToActivityShow(context),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.grey[300],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Visualizar Atividades',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
