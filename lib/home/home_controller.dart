import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/home/home_repository.dart';
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

  final repository = HomeRepository();

  void getUser() async {
    setStateNotifier = HomeState.loading;

    user = await repository.getUser();

    setStateNotifier = HomeState.success;
  }

  void getQuizzes() async {
    setStateNotifier = HomeState.loading;

    quizzes = await repository.getQuizzes();

    setStateNotifier = HomeState.success;
  }
}