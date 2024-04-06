import 'package:flutter/material.dart';
import 'package:googlevrtoolkit/googlevrtoolkit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VrGamePage(),
    );
  }
}

class VrGamePage extends StatefulWidget {
  @override
  _VrGamePageState createState() => _VrGamePageState();
}

class _VrGamePageState extends State<VrGamePage> {
  late VrController _vrController;

  @override
  void initState() {
    super.initState();
    _initializeVr();
  }

  void _initializeVr() {
    _vrController = VrController();
    _vrController.initialize();
  }

  @override
  void dispose() {
    _vrController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VR Game'),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: VrScene(
            controller: _vrController,
            onSceneCreated: _onSceneCreated,
          ),
        ),
      ),
    );
  }

  void _onSceneCreated(VrSceneController sceneController) {
    // Create and add objects to the scene
    final sphere = VrSphere(radius: 50, widthSegments: 20, heightSegments: 20);
    final material = VrMaterial(color: Colors.blue, isLit: true);
    final sphereNode = VrNode(geometry: sphere, material: material);
    sceneController.addNode(sphereNode);

    // Set up camera for VR view
    final camera = VrPerspectiveCamera(
      fov: 90,
      aspectRatio: 1,
      near: 0.1,
      far: 1000,
    );
    sceneController.setCamera(camera);
  }
}
