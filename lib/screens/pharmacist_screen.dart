import 'package:flutter/material.dart';

class PharmacistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Espace Pharmacien'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                // Logique pour vérifier une prescription
              },
              icon: Icon(Icons.verified),
              label: Text('Vérifier Prescription'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Logique pour délivrer des médicaments
              },
              icon: Icon(Icons.local_pharmacy),
              label: Text('Délivrer Médicaments'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 254, 122, 82),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Logique pour gérer les stocks de médicaments
              },
              icon: Icon(Icons.inventory),
              label: Text('Gérer les Stocks'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 227, 121, 82),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
