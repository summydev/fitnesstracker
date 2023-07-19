import 'package:flutter/material.dart';
import 'package:quizapp/constants.dart';
import 'package:quizapp/models/db_connect.dart';
import 'package:quizapp/models/question_model.dart';
import 'package:quizapp/views/widgets/next_button.dart';
import 'package:quizapp/views/widgets/option_card.dart';
import 'package:quizapp/views/widgets/question_widget.dart';
import 'package:quizapp/views/widgets/result_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var db = DBconnect();
  late Future _questions;

  // List<Question> _question = [
  //   Question(
  //       id: '10',
  //       title: 'wrrt giuiu hhiuiu?',
  //       option: {'40': false, '60': true, '67': false, '79': false})
  // ];
  Future<List<Question>> getData() async {
    return db.fetchQuestion();
  }

  @override
  void initState() {
  
    _questions = getData();
    super.initState();
  }

  int index = 0;
  int score = 0;
  bool isAlreadySelected = false;
  void nextquestion( int questionlength) {
    //print('next');
    if (index == questionlength - 1) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => ResultBox(
                questionLength: questionlength,
                result: score,
                onPressed: startOver,
              ));
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'please select an option',
            ),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(vertical: 20),
          ),
        );
      }
    }
  }

  bool isPressed = false;

  void checkAnswerandUpdate(bool value) {
    // ignore: avoid_print
    //print('checking');
    if (isAlreadySelected) {
      return;
    } else {
      if (value == true) {
        score++;
      }
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }
  }

  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _questions as Future<List<Question>>,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            var extractedData = snapshot.data as List<Question>;
            return Scaffold(
              backgroundColor: background,
              appBar: AppBar(
                title: const Text('QUIZAPP'),
                backgroundColor: background,
                shadowColor: Colors.transparent,
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      'score: $score',
                    ),
                  ),
                ],
              ),
              body: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                width: double.infinity,
                child: Column(children: [
                  QuestionWidget(
                      indexAction: index,
                      question: extractedData[index].title,
                      totalQuestions: extractedData.length),
                  const Divider(
                    color: neutral,
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  for (int i = 0; i < extractedData[index].option.length; i++)
                    GestureDetector(
                      onTap: () => checkAnswerandUpdate(
                          extractedData[index].option.values.toList()[i]),
                      child: OptionCard(
                        option: extractedData[index].option.keys.toList()[i],
                        color: isPressed
                            ? extractedData[index].option.values.toList()[i] ==
                                    true
                                ? correct
                                : incorrect
                            : neutral,
                      ),
                    ),
                ]),
              ),
              floatingActionButton: GestureDetector(
                onTap: () =>  nextquestion(extractedData.length),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: NextButton(),
                )),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
            );
          }
        } else {
          return const Center(
            child: Column(
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 20.0,),
                Text('pplease wait while question loads')
              ],
            ),
          );
        }
        return const Center(
          child: Text('no data'),
        );
      },
    );
  }
}
