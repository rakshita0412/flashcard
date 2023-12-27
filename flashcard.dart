import 'package:flutter/material.dart';
import '../src/homepage.dart';
import '../src/flashcardscreen.dart';
import 'dart:io';


class MyFlashCardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flash Card App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/flashcards': (context) => FlashCardScreen(),
      },
    );
  }
}

class FlashCard {
  final String question;
  final String answer;
  final File? image;

  FlashCard({
    required this.question,
    required this.answer,
    this.image,
  });
}

