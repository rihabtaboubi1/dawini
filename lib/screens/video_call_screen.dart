import 'package:flutter/material.dart';
class VideoCallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appel Vidéo avec Médecin'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: Text(
          'Appel Vidéo en cours...',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
