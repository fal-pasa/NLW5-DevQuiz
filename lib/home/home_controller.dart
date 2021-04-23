import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/home/home_state.dart';
import 'package:DevQuiz/shared/models/awnser_model.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:DevQuiz/shared/models/quiz_model.dart';
import 'package:DevQuiz/shared/models/user_model.dart';
import 'package:flutter/widgets.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);

  set setStateNotifier(HomeState state) => stateNotifier.value = state;
  HomeState get getStateNotifier => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() async {
    setStateNotifier = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));

    user = UserModel(
      name: "Henrique",
      photoUrl: "https://avatars.githubusercontent.com/u/51676261?v=4",
    );

    setStateNotifier = HomeState.success;
  }

  void getQuizzes() async {
    setStateNotifier = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));

    quizzes = [
      QuizModel(
        title: "NLW5 Fluter",
        imagem: AppImages.blocks,
        questionAnswered: 1,
        level: Level.facil,
        questions: [
          QuestionModel(
            title: "Está curtindo o Fluter?",
            awnsers: [
              AwnserModel(title: "Pouco"),
              AwnserModel(title: "Não muito"),
              AwnserModel(title: "Tá Legal"),
              AwnserModel(title: "Estou Amando", isRight: true)
            ]
          ),
          QuestionModel(
            title: "Está curtindo o Fluter?",
            awnsers: [
              AwnserModel(title: "Pouco"),
              AwnserModel(title: "Não muito"),
              AwnserModel(title: "Tá Legal"),
              AwnserModel(title: "Estou Amando", isRight: true)
            ]
          )
        ],
      )
    ];

    setStateNotifier = HomeState.success;
  }
}