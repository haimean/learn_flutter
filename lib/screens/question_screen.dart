import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_flutter/component/answer_button.dart';
import 'package:learn_flutter/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.addAnswer, {super.key});

  final void Function(String answer) addAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestion = 0;
  void nextQuestion(String answer) {
    widget.addAnswer(answer);
    setState(() {
      if (questions.length - 1 != currentQuestion) {
        currentQuestion++;
      }
    });
  }

  @override
  Widget build(context) {
    final questionItem = questions[currentQuestion];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questionItem.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 104, 41, 149),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...questionItem.getShuffledAnswers().map(
                  (answer) => AnswerButton(
                    answerText: answer,
                    onTap: () {
                      nextQuestion(answer);
                    },
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
