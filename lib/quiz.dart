import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_flutter/data/questions.dart';
import 'package:learn_flutter/screens/question_screen.dart';
import 'package:learn_flutter/screens/result_screen.dart';
import 'package:learn_flutter/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> selectedAnswers = [];

  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(brightness: brightness);
    return baseTheme.copyWith(
      textTheme: GoogleFonts.latoTextTheme(
        baseTheme.textTheme,
      ),
    );
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (questions.length == selectedAnswers.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    switch (activeScreen) {
      case 'start-screen':
        screenWidget = StartScreen(switchScreen);
        break;
      case 'questions-screen':
        screenWidget = QuestionsScreen(chooseAnswer);
        break;
      case 'result-screen':
        screenWidget = ResultScreen(
            selectedAnswers: selectedAnswers, restartQuiz: restartQuiz);
        break;
      default:
    }
    return MaterialApp(
      title: 'Flutter Demo',
      locale: DevicePreview.locale(context), //* for device_preview
      builder: DevicePreview.appBuilder, //* for device_preview
      theme: _buildTheme(Brightness.dark),
      darkTheme: ThemeData.light(),
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(65, 41, 90, 0.6),
                Color.fromRGBO(47, 7, 67, 0.6),
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
