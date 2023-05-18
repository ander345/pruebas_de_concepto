import 'package:flutter/material.dart';
import 'package:google_maps_app/google_maps_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Google Maps',
      debugShowCheckedModeBanner: false,
      home: InitScreen(),
    );
  }
}

class InitScreen extends StatefulWidget {
  const InitScreen();

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 5,
            child: InkWell(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GoogleMapsScreen(),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Google Maps',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
