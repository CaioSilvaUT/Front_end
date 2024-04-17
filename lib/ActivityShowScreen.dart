import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'DeliveryRegistrationScreen.dart';
class ActivityShowScreen extends StatefulWidget {
  @override
  
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityShowScreen> {
  List<dynamic> activities = [];
  @override
  void initState() {
    super.initState();
    fetchActivities();
  }

  Future<void> fetchActivities() async {
    String url = 'http://localhost:3000/activities'; // URL da rota para recuperar atividades

    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setState(() {
          activities = jsonDecode(response.body);
        });
      } else {
        print('Erro ao recuperar atividades: ${response.body}');
      }
    } catch (e) {
      print('Erro de conexão: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Atividades'),
      ),
      body: ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(activities[index]['nome']), // Nome da atividade
            subtitle: Text(activities[index]['descricao']), // Descrição da atividade
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DeliveryRegistrationScreen(activity : activities[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
