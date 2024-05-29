import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pylearn_v1/home/quiz/quiz.dart';
import 'package:pylearn_v1/service/database.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:async';

class Questions extends StatefulWidget {
  final String category;

  const Questions({super.key, required this.category});

  @override
  // ignore: library_private_types_in_public_api
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  late Future<void> _initializeData;
  late List<DocumentSnapshot> _quizList;
  bool _showAnswer = false;
  late PageController _pageController;
  int _selectedOptionIndex = -1;
  int _correctAnswerCount = 0;
  final Map<int, List<String>> _shuffledOptions = {};

  Timer? _timer;
  int _remainingSeconds = 20;
  double _progressValue = 1.0;

  @override
  void initState() {
    super.initState();
    _initializeData = _initializeStream();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _initializeStream() async {
    var quizStream = await DatabaseMethods().getCategoryQuiz(widget.category);
    _quizList = (await quizStream.first).docs;
    _quizList.shuffle();
    for (var i = 0; i < _quizList.length; i++) {
      _shuffledOptions[i] = _getShuffledOptions(_quizList[i]);
    }
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() {
      _remainingSeconds = 20;
      _progressValue = 1.0;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
          _progressValue = _remainingSeconds / 20;
        });
      } else {
        _timer?.cancel();
        _pageController.nextPage(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeIn,
        );
      }
    });
  }

  Color _getColorFromProgress(double progress) {
    if (progress >= 0.75) {
      return Colors.green;
    } else if (progress >= 0.5) {
      return Colors.yellow;
    } else if (progress >= 0.25) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  Animation<Color?> _getColorAnimation() {
    return AlwaysStoppedAnimation<Color?>(
        _getColorFromProgress(_progressValue));
  }

  bool _showAppBar = true;

  AppBar _buildAppBar() {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.black],
          ),
        ),
      ),
      title: const Text(
        'Quizz',
        style: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        },
        color: Colors.black,
        iconSize: 30,
      ),
      actions: [
        SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            value: _progressValue,
            strokeWidth: 5,
            backgroundColor: Colors.grey[300],
            valueColor: _getColorAnimation(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: Text(
              'SKOR: $_correctAnswerCount',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<String> _getShuffledOptions(DocumentSnapshot ds) {
    List<String> options = [
      ds["Option1"],
      ds["Option2"],
      ds["Option3"],
      ds["Option4"],
    ];
    options.shuffle();
    return options;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _showAppBar ? _buildAppBar() : null,
      body: FutureBuilder<void>(
        future: _initializeData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _quizList.length + 1,
              itemBuilder: (context, index) {
                if (index == _quizList.length) {
                  return QuizResultPage(
                      correctAnswerCount: _correctAnswerCount,
                      category: widget.category);
                }
                final DocumentSnapshot ds = _quizList[index];
                return _buildQuizCard(context, ds, index);
              },
              onPageChanged: (index) {
                setState(() {
                  if (index < _quizList.length) {
                    _showAnswer = false;
                    _selectedOptionIndex = -1;
                    _startTimer();
                  } else {
                    _showAppBar = false;
                  }
                });
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildQuizCard(BuildContext context, DocumentSnapshot ds, int index) {
    List<String> options = _shuffledOptions[index]!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: CachedNetworkImage(
            imageUrl: ds["Image"],
            fit: BoxFit.contain,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        _buildOption(options[0], ds["Correct"] == options[0], 0, ds["Correct"]),
        _buildOption(options[1], ds["Correct"] == options[1], 1, ds["Correct"]),
        _buildOption(options[2], ds["Correct"] == options[2], 2, ds["Correct"]),
        _buildOption(options[3], ds["Correct"] == options[3], 3, ds["Correct"]),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 7),
              child: IconButton(
                onPressed: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeIn,
                  );
                },
                icon: const Icon(Icons.arrow_forward_ios_rounded),
                iconSize: 30,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOption(
      String option, bool isCorrect, int index, String correctOption) {
    bool isSelected = _selectedOptionIndex == index;

    if (!_showAnswer) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _showAnswer = true;
            _selectedOptionIndex = index;
          });
          if (isCorrect) {
            _correctAnswerCount += 10;
          }
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Text(
            option,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    } else {
      if (isSelected && isCorrect) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Text(
            option,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      } else if (isSelected && !isCorrect) {
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 2),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Text(
                option,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 2),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Text(
                correctOption,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        );
      } else {
        return const SizedBox();
      }
    }
  }
}

class QuizResultPage extends StatelessWidget {
  final int correctAnswerCount;
  final String category;

  const QuizResultPage(
      {super.key, required this.correctAnswerCount, required this.category});

  @override
  Widget build(BuildContext context) {
    String message;
    if (correctAnswerCount < 40) {
      message = "Daha çok çalışmalısın.";
    } else if (correctAnswerCount >= 40 && correctAnswerCount <= 60) {
      message = "İyi ilerliyorsun.";
    } else {
      message = "Tebrikler!";
    }

    String emoji;
    if (correctAnswerCount < 10) {
      emoji = "😢";
    } else if (correctAnswerCount >= 10 && correctAnswerCount <= 20) {
      emoji = "😐";
    } else {
      emoji = "😊";
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              emoji,
              style: const TextStyle(fontSize: 40),
            ),
            const SizedBox(height: 25),
            Container(
              width: 325,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 85, 150, 207),
              ),
              child: Text(
                '🏆\n'
                'Quiz Sonucum\n\n'
                'Puanım: $correctAnswerCount\n\n'
                '$message',
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () async {
                try {
                  String uid = FirebaseAuth.instance.currentUser!.uid;

                  await DatabaseMethods()
                      .storeQuizScore(uid, category, correctAnswerCount);

                  await DatabaseMethods().markQuizCompleted(uid, category);

                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Tebrikler quiz'i başarıyla tamamladın.👏",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.black,
                    ),
                  );
                } catch (e) {
                  // ignore: avoid_print
                  print('Hata oluştu: $e');
                }

                // ignore: use_build_context_synchronously
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const Quizzes(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: const Size(140, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(
                'Tamamla',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            IconButton(
              onPressed: () async {
                try {
                  await Share.share(
                    '🏆 Quiz Sonucum\n\n'
                    'Puanım: $correctAnswerCount\n\n'
                    'Quiz sonucumu paylaşıyorum!',
                  );
                  // ignore: avoid_print
                  print('Paylaşma işlemi başarılı');
                } catch (e) {
                  // ignore: avoid_print
                  print('Hata oluştu: $e');
                }
              },
              icon: const Icon(Icons.share),
              iconSize: 25,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
