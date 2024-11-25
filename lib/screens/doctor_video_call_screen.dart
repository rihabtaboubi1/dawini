import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class DoctorVideoCallScreen extends StatefulWidget {
  final String patientName;

  DoctorVideoCallScreen({required this.patientName});

  @override
  _DoctorVideoCallScreenState createState() => _DoctorVideoCallScreenState();
}

class _DoctorVideoCallScreenState extends State<DoctorVideoCallScreen> {
  late RTCVideoRenderer _localRenderer;
  late RTCVideoRenderer _remoteRenderer;
  late MediaStream _localStream;

  bool _isVideoLoading = true; // Gère l'affichage du message de chargement

  @override
  void initState() {
    super.initState();

    // Initialisation des rendus vidéo
    _localRenderer = RTCVideoRenderer();
    _remoteRenderer = RTCVideoRenderer();

    // Démarrer les flux vidéo
    initRenderers();
  }

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
      _isVideoLoading = false; // Masquer le message de chargement une fois prêt
    });

    // Associer le flux local au renderer local
    _localRenderer.srcObject = localStream;

    // Simulez la vidéo distante en attendant d'ajouter la signalisation WebRTC
    // _remoteRenderer.srcObject = <MediaStream depuis WebRTC signalisation>
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
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Stack(
          children: [
            // Vidéo distante (du patient)
            Positioned.fill(
              child: RTCVideoView(_remoteRenderer),
            ),
            // Vidéo locale (du médecin)
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
                child: RTCVideoView(_localRenderer), // Affiche la caméra du médecin
              ),
            ),
            // Affichage d'un message de chargement
            if (_isVideoLoading)
              Center(
                child: CircularProgressIndicator(),
              ),
            if (_isVideoLoading)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Connexion à l'appel...",
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
