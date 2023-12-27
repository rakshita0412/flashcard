import 'package:flutter/material.dart';
import '../src/flashcard.dart';

class FlashCardWidget extends StatefulWidget {
  final List<FlashCard> flashcards;

  FlashCardWidget(this.flashcards);

  @override
  _FlashCardWidgetState createState() => _FlashCardWidgetState();
}

class _FlashCardWidgetState extends State<FlashCardWidget> {
  int currentIndex = 0;
  bool showAnswer = false;

  void showNextCard() {
    setState(() {
      currentIndex = (currentIndex + 1) % widget.flashcards.length;
      showAnswer = false;
    });
  }

  void toggleAnswer() {
    setState(() {
      showAnswer = !showAnswer;
    });
  }

  void shuffleCards() {
    setState(() {
      widget.flashcards.shuffle();
      currentIndex = 0;
      showAnswer = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: toggleAnswer,
          child: Card(
            elevation: 4.0,
            margin: EdgeInsets.all(16.0),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.flashcards[currentIndex].image != null)
                    Image.file(
                      widget.flashcards[currentIndex].image!,
                      height: 100,
                      width: 100,
                    ),
                  Text(
                    showAnswer
                        ? widget.flashcards[currentIndex].answer
                        : widget.flashcards[currentIndex].question,
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: showNextCard,
                    child: Text('Next Card'),
                  ),
                ],
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: shuffleCards,
          child: Text('Shuffle'),
        ),
      ],
    );
  }
}