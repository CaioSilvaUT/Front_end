import 'package:flutter/material.dart';
import 'ActivityRegistrationScreen.dart';
import 'ActivityShowScreen.dart';
import 'LoginScreen.dart'; 
import 'package:jwt_decode/jwt_decode.dart';

class HomeScreen extends StatelessWidget {
  final String? authToken;

  const HomeScreen({Key? key, this.authToken}) : super(key: key);
  bool get isTokenExpired {
    if (authToken == null) {
      return true;
    }

    return Jwt.isExpired(authToken!);
  }
  void navigateToActivityRegistration(BuildContext context) {
    if (!isTokenExpired) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ActivityRegistrationScreen(authToken: authToken)),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erro de Autenticação'),
          content: Text('Você precisa estar logado para acessar esta funcionalidade.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
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
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erro de Autenticação'),
          content: Text('Você precisa estar logado para acessar esta funcionalidade.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
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
