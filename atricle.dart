import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _articleController = TextEditingController();
  List<Map<String, dynamic>> _articles = [];

  void _publishArticle() {
    String userName = 'John Doe'; // Replace with actual user information

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

    setState(() {
      String article = _articleController.text;
      _articles.add({'content': article, 'user': userName, 'time': formattedDate});
      _articleController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Hello! Welcome to the Articles Page',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _articleController,
              decoration: InputDecoration(
                hintText: 'Write your article here',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _publishArticle,
            child: Text('Publish Article'),
          ),
          SizedBox(height: 20),
          Text(
            '',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _articles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_articles[index]['content']!),
                  subtitle: Text('Published by: ${_articles[index]['user']!} at ${_articles[index]['time']!}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
