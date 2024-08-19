import 'package:flutter/material.dart';
import '../src/flashcard.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the Flash Card App!'),
            SizedBox(height: 20), // Adding some space between text and button
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/flashcards', arguments: flashcards);
              },
              child: Text('Go to Flash Cards'),
            ),
          ],
        ),
      ),
    );
  }
}



