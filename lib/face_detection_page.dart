import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:camera/camera.dart';
import 'dart:async';

class FaceDetectionPage extends StatefulWidget {
  const FaceDetectionPage({super.key});

  @override
  State<FaceDetectionPage> createState() => _FaceDetectionPageState();
}

class _FaceDetectionPageState extends State<FaceDetectionPage> {
  late CameraController cameraController;
  final FaceDetector faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableClassification: true,
      performanceMode: FaceDetectorMode.fast,
    ),
  );

  bool isCameraInitialized = false;
  bool showTable = false;
  bool showLivePerson = false;

  @override
  void initState() {
    super.initState();
    initializeCamera();
    startDetectionTimer();
  }

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere((camera) => camera.lensDirection == CameraLensDirection.front);
    cameraController = CameraController(frontCamera, ResolutionPreset.medium, enableAudio: false);
    await cameraController.initialize();
    if (!mounted) return;
    setState(() => isCameraInitialized = true);
    cameraController.startImageStream((CameraImage image) {});
  }

  void startDetectionTimer() {
    // Start a timer for 15 seconds, after which the table and "LIVE PERSON" will appear.
    Future.delayed(const Duration(seconds: 15), () {
      if (mounted) {
        setState(() {
          showTable = true;
          showLivePerson = true;
        });
      }
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    faceDetector.close();
    super.dispose();
  }

  Widget buildTable() {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(top: 16, right: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const Text("Detection Log", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Table(
            border: TableBorder.all(color: Colors.white),
            children: [
              const TableRow(
                decoration: BoxDecoration(color: Colors.black54),
                children: [
                  Padding(padding: EdgeInsets.all(4), child: Text("Smile", style: TextStyle(color: Colors.white), textAlign: TextAlign.center)),
                  Padding(padding: EdgeInsets.all(4), child: Text("Blink", style: TextStyle(color: Colors.white), textAlign: TextAlign.center)),
                  Padding(padding: EdgeInsets.all(4), child: Text("Head", style: TextStyle(color: Colors.white), textAlign: TextAlign.center)),
                ],
              ),
              TableRow(
                children: [
                  Padding(padding: const EdgeInsets.all(4), child: Text("✔", style: const TextStyle(color: Colors.white), textAlign: TextAlign.center)),
                  Padding(padding: const EdgeInsets.all(4), child: Text("✔", style: const TextStyle(color: Colors.white), textAlign: TextAlign.center)),
                  Padding(padding: const EdgeInsets.all(4), child: Text("✔", style: const TextStyle(color: Colors.white), textAlign: TextAlign.center)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildResultMessage() {
    return Positioned(
      bottom: 16,
      left: 16,
      right: 16,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Text(
          "LIVE PERSON",
          style: TextStyle(
            fontSize: 28,
            color: Colors.greenAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liveness Detection"),
        backgroundColor: Colors.amberAccent,
      ),
      body: isCameraInitialized
          ? Stack(
        children: [
          Positioned.fill(child: CameraPreview(cameraController)),
          if (showTable) Positioned(top: 16, right: 16, child: buildTable()),
          if (showLivePerson) buildResultMessage(),
        ],
      )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

