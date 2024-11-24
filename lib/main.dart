import 'package:flutter/material.dart';
import 'screens/doctor_screen.dart';
import 'screens/patient__screen.dart';
import 'screens/pharmacist_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

// Classe HomeScreen
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bienvenue')),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: _buildAnimatedSection(
                    context,
                    title: "Doctor",
                    color: Colors.blueAccent,
                    icon: Icons.local_hospital,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => DoctorScreen()));
                    },
                  ),
                ),
                Expanded(
                  child: _buildAnimatedSection(
                    context,
                    title: "Patient",
                    color: Colors.greenAccent,
                    icon: Icons.person,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => PatientScreen()));
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _buildAnimatedSection(
              context,
              title: "Pharmacist",
              color: Colors.orangeAccent,
              icon: Icons.local_pharmacy,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => PharmacistScreen()));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedSection(BuildContext context,
      {required String title, required Color color, required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        color: color,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 60, color: Colors.white),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
