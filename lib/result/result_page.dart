import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int result;

  const ResultPage({
    Key? key,
    required this.title,
    required this.length,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.only(
          top: 40,
          left: 20,
          right: 20
        ),
        child:
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(AppImages.trophy),
              Column(
                children: [
                  Text(
                    "Parábens!",
                    style: AppTextStyles.heading40,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Você concluiu",
                    style: AppTextStyles.body,
                  ),
                  Text(
                    title,
                    style: AppTextStyles.bodyBold,
                  ),
                  Text(
                    "com $result de $length acertos.!",
                    style: AppTextStyles.body,
                  ),
                ],
              ),

              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: NextButtonWidget.purple(
                          label: "Compartilhar",
                          onTap: () {
                            Share.share(
                              'DevQuiz NLW 5 - Fluter: Resultado do Quiz $title\nObtive ${((result/length) * 100).toInt()}% aproveitamento!'
                            );
                          },
                        )
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  NextButtonWidget.transparent(
                    label: "Voltar ao início",
                    onTap: () {
                      Navigator.pop(context);
                    }
                  ),
                ],
              ),
            ],
          ),
      )
    );
  }
}