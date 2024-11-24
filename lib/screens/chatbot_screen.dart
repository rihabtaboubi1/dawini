import 'package:flutter/material.dart';
class ChatbotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot Consultation'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text(
          'Bienvenue dans le Chatbot.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
