import 'package:flutter/material.dart';
import 'package:pharma/screens/chatbot_screen.dart';
import 'package:pharma/screens/video_call_screen.dart';

class ConsultationChoiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choisir le Mode de Consultation'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                // Naviguer vers l'écran du Chatbot
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ChatbotScreen()),
                );
              },
              icon: Icon(Icons.chat),
              label: Text('Utiliser Chatbot'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                // Naviguer vers l'écran d'appel vidéo
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => VideoCallScreen()),
                );
              },
              icon: Icon(Icons.video_call),
              label: Text('Appel Vidéo avec Médecin'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
