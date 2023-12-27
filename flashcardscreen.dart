import 'dart:io';
import 'package:flutter/material.dart';
import '../src/flashcard.dart';
import 'package:image_picker/image_picker.dart';
import '../src/flashcardwidget.dart';


class FlashCardScreen extends StatefulWidget {
  @override
  _FlashCardScreenState createState() => _FlashCardScreenState();
}

class _FlashCardScreenState extends State<FlashCardScreen> {
  List<FlashCard> flashcards = [];
  TextEditingController questionController = TextEditingController();
  TextEditingController answerController = TextEditingController();
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flash Card App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: flashcards.isEmpty
                ? Center(
              child: Text('No flashcards yet! Add some.'),
            )
                : FlashCardWidget(flashcards),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: questionController,
                  decoration: InputDecoration(labelText: 'Question'),
                ),
                TextField(
                  controller: answerController,
                  decoration: InputDecoration(labelText: 'Answer'),
                ),
                SizedBox(height: 10),
                _buildImagePicker(),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: addFlashCard,
                  child: Text('Add Flashcard'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImagePicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Select Image:'),
        ElevatedButton(
          onPressed: () async {
            final image = await ImagePicker().pickImage(source: ImageSource.gallery);
            setState(() {
              selectedImage = image != null ? File(image.path) : null;
            });
          },
          child: Text('Pick Image'),
        ),
      ],
    );
  }

  void addFlashCard() {
    if (questionController.text.isNotEmpty && answerController.text.isNotEmpty) {
      setState(() {
        flashcards.add(
          FlashCard(
            question: questionController.text,
            answer: answerController.text,
            image: selectedImage,
          ),
        );
        questionController.clear();
        answerController.clear();
        selectedImage = null;
      });
    }
  }
}