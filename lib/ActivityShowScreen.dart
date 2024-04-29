import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'DeliveryRegistrationScreen.dart';

class ActivityShowScreen extends StatefulWidget {
  final String? authToken;
  const ActivityShowScreen({Key? key, this.authToken}) : super(key: key);

  @override
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
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${widget.authToken}',
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic> allActivities = jsonDecode(response.body);
        setState(() {
          activities = allActivities.where((activity) => activity['userId'] != getCurrentUserId()).toList();
        });
      } else {
        print('Erro ao recuperar atividades: ${response.body}');
      }
    } catch (e) {
      print('Erro de conexão: $e');
    }
  }
  int getCurrentUserId() {
    if (widget.authToken != null) {
      final tokenParts = widget.authToken!.split('.');
      final payload = jsonDecode(utf8.decode(base64Url.decode(base64Url.normalize(tokenParts[1]))));
      return payload['userId'];
    }
    return 0;
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
                    builder: (context) => DeliveryRegistrationScreen(
                      activity: activities[index],
                      authToken: widget.authToken,
                    ),
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
