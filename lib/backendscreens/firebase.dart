import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Human Anatomy VR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnatomyViewer(),
    );
  }
}

class AnatomyViewer extends StatefulWidget {
  @override
  _AnatomyViewerState createState() => _AnatomyViewerState();
}

class _AnatomyViewerState extends State<AnatomyViewer> {
  final reference = FirebaseDatabase.instance.reference().child('anatomy');

  @override
  void initState() {
    super.initState();
    // Initialize Firebase references
  }

  void fetchData() {
    reference.once().then((DataSnapshot snapshot) {
      // Handle fetched data from Firebase
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Human Anatomy VR'),
      ),
      body: Center(
        // Render 3D model here
        child: Text('3D Model'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchData(); // Call to fetch data from Firebase
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
