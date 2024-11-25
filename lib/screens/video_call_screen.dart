import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class VideoCallScreen extends StatefulWidget {
  final String patientName;

  VideoCallScreen({required this.patientName});

  @override
  _VideoCallScreenState createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  late RTCVideoRenderer _localRenderer;
  late RTCVideoRenderer _remoteRenderer;
  late MediaStream _localStream;

  bool _isVideoLoading = true; // Variable pour gérer l'affichage du message d'attente

  @override
  void initState() {
    super.initState();

    // Initialisation des rendus vidéo
    _localRenderer = RTCVideoRenderer();
    _remoteRenderer = RTCVideoRenderer();

    // Initialisation des flux vidéo
    initRenderers();
  }

  // Fonction pour initialiser les flux vidéo
  Future<void> initRenderers() async {
    await _localRenderer.initialize();
    await _remoteRenderer.initialize();

    // Demander l'accès à la caméra et au micro
    MediaStream localStream = await navigator.mediaDevices.getUserMedia({
      'audio': true,
      'video': true,
    });

    setState(() {
      _localStream = localStream;
      _isVideoLoading = false; // Une fois le flux local prêt, on arrête d'afficher le message de chargement
    });

    // Afficher la vidéo locale
    _localRenderer.srcObject = localStream;
  }

  @override
  void dispose() {
    // Libérer les ressources
    _localRenderer.dispose();
    _remoteRenderer.dispose();
    _localStream.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appel Vidéo avec ${widget.patientName}'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Stack(
          children: [
            // Affichage de la vidéo distante (du médecin) si elle est prête
            Positioned.fill(
              child: RTCVideoView(_remoteRenderer), // Affiche la vidéo distante
            ),
            // Affichage de la vidéo locale (du patient) dans un petit cadre
            Positioned(
              bottom: 20,
              right: 20,
              child: Container(
                width: 120,
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blueAccent, width: 2),
                ),
                child: RTCVideoView(_localRenderer), // Affiche la vidéo locale
              ),
            ),
            // Affichage du message "En cours, veuillez patienter..." pendant la préparation
            if (_isVideoLoading)
              Center(
                child: CircularProgressIndicator(), // Affiche un indicateur de chargement
              ),
            if (_isVideoLoading)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "En cours, veuillez patienter...",
                    style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
