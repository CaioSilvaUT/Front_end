import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'DeliveryRegistrationScreen.dart';

class ActivityShowScreen extends StatefulWidget {
  @override
  final String? authToken; // Definindo o parâmetro authToken
  // Adicione o construtor que recebe o authToken
  const ActivityShowScreen({Key? key, this.authToken}) : super(key: key);
  _ActivityShowScreenState createState() => _ActivityShowScreenState();
}

class _ActivityShowScreenState extends State<ActivityShowScreen> {
  List<dynamic> activities = [];
  
  @override
  void initState() {
    super.initState();
    fetchActivities();
  }

  Future<void> fetchActivities() async {
    String url = 'http://localhost:3000/activities';

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
          return Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ListTile(
              title: Text(activities[index]['nome']),
              subtitle: Text(activities[index]['descricao']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeliveryRegistrationScreen(activity: activities[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
