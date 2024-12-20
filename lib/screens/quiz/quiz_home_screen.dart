import 'package:flutter/material.dart';

import '../../models/quiz_model/flutter_topics_model.dart';
import 'flashcard_screen.dart';

class QuizHomePage extends StatelessWidget {
  const QuizHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color bgColor = Color.fromARGB(255, 100, 88, 103);
    const Color bgColor3 = Color(0xFF5170FD);
    return Scaffold(
      // backgroundColor: bgColor3,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 0, left: 15, right: 15),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'CCW Quiz',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: 30,
                        // color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.85,
                ),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: flutterTopicsList.length,
                itemBuilder: (context, index) {
                  final topicsData = flutterTopicsList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewCard(
                            typeOfTopic: topicsData.topicQuestions,
                            topicName: topicsData.topicName,
                          ),
                        ),
                      );
                      print(topicsData.topicName);
                    },
                    child: Card(
                      color: bgColor,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Icon(
                            //   topicsData.topicIcon,
                            //   color: Colors.white,
                            //   size: 55,
                            // ),
                            Image.asset(
                              topicsData.topicIcon,
                              height: 50,
                              width: 50,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              topicsData.topicName,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
