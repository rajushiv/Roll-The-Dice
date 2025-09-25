import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Card Example")),
        body: Center(
          child: Card(
            elevation: 4, // shadow depth
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // rounded corners
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "Flutter Card",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text("This is a simple card widget example."),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
