import 'package:flutter/material.dart';
import 'package:pharma/screens/consultation_choice_screen.dart'; // Importation de l'écran de choix

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
            // Bouton pour demander une consultation
            ElevatedButton.icon(
              onPressed: () {
                // Naviguer vers l'écran de choix de la consultation
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ConsultationChoiceScreen(patientName: 'Patient A')), // Passer le nom du patient
                );
              },
              icon: Icon(Icons.request_page),
              label: Text('Demander une Consultation'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            // Bouton pour voir l'historique des consultations
            ElevatedButton.icon(
              onPressed: () {
                // Logique pour voir l'historique des consultations
              },
              icon: Icon(Icons.history),
              label: Text('Voir Historique'),
              style: ElevatedButton.styleFrom(
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
