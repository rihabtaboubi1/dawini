import 'package:flutter/material.dart';
import 'package:pharma/screens/consultation_choice_screen.dart';

class PatientScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Espace Patient'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                // Naviguer vers l'écran de choix
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ConsultationChoiceScreen()),
                );
              },
              icon: Icon(Icons.request_page),
              label: Text('Demander une Consultation'),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Logique pour voir l'historique des consultations
              },
              icon: Icon(Icons.history),
              label: Text('Voir Historique'),
            ),
          ],
        ),
      ),
    );
  }
}


