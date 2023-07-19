import 'package:http/http.dart' as http;
import 'question_model.dart';
import 'dart:convert';

class DBconnect {
  final url = Uri.parse(
      'https://quizapp-8e7ea-default-rtdb.firebaseio.com/question.json');
  Future<void> addQuestion(Question question) async {
    http.post(url,
        body: json.encode({
          "title": question.title,
          "options": question.option,
        }));
  }

  Future<List<Question>> fetchQuestion() async {
    return http.get(url).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<Question> newQuestion = [];
      data.forEach((key, value) {
        var newquestion = Question(
            id: key,
            title: value['title'],
            option: Map.castFrom(value['option']));
        newQuestion.add(newquestion);
      });

      return newQuestion;
    });
  }
}
