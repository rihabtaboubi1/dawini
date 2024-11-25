import 'package:flutter/material.dart';
import 'doctor_video_call_screen.dart';

class DoctorScreen extends StatefulWidget {
  @override
  _DoctorScreenState createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  List<String> consultations = [
    "Consultation avec Patient A",
    "Consultation avec Patient B",
    "Consultation avec Patient C",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultations disponibles'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: consultations.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(consultations[index]),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Bouton Accepter
                  ElevatedButton(
                    onPressed: () {
                      // Naviguer vers l'écran d'appel vidéo
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DoctorVideoCallScreen(
                            patientName: consultations[index],
                          ),
                        ),
                      );
                    },
                    child: Text('Accepter'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                  ),
                  SizedBox(width: 10),
                  // Bouton Rejeter
                  ElevatedButton(
                    onPressed: () {
                      // Supprimer la consultation de la liste
                      setState(() {
                        consultations.removeAt(index);
                      });
                      // Afficher un message de confirmation
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Consultation rejetée'),
                        ),
                      );
                    },
                    child: Text('Rejeter'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
