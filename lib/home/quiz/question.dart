import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pylearn_v1/home/quiz/quiz.dart';
import 'package:pylearn_v1/service/database.dart';
import 'package:share_plus/share_plus.dart';

class Questions extends StatefulWidget {
  final String category;

  const Questions({super.key, required this.category});

  @override
  // ignore: library_private_types_in_public_api
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  late Future<void> _initializeData;
  late Stream<QuerySnapshot> _quizStream;
  bool _showAnswer = false;
  late PageController _pageController;
  int _selectedOptionIndex = -1;
  int _correctAnswerCount = 0;

  @override
  void initState() {
    super.initState();
    _initializeData = _initializeStream();
    _pageController = PageController();
  }

  Future<void> _initializeStream() async {
    _quizStream = await DatabaseMethods().getCategoryQuiz(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.black
              ],
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
      ),
      body: FutureBuilder<void>(
        future: _initializeData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return StreamBuilder<QuerySnapshot>(
              stream: _quizStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('No data available'));
                }
                return PageView.builder(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.docs.length + 1,
                  itemBuilder: (context, index) {
                    if (index == snapshot.data!.docs.length) {
                      return QuizResultPage(
                          correctAnswerCount: _correctAnswerCount,
                          category: widget.category);
                    }
                    final DocumentSnapshot ds = snapshot.data!.docs[index];
                    return _buildQuizCard(context, ds, index);
                  },
                  onPageChanged: (index) {
                    setState(() {
                      if (index < snapshot.data!.docs.length) {
                        _showAnswer = false;
                        _selectedOptionIndex = -1;
                      }
                    });
                  },
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildQuizCard(BuildContext context, DocumentSnapshot ds, int index) {
    String correctOption = ds["Correct"];

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
        _buildOption(
            ds["Option1"], ds["Correct"] == ds["Option1"], 0, correctOption),
        _buildOption(
            ds["Option2"], ds["Correct"] == ds["Option2"], 1, correctOption),
        _buildOption(
            ds["Option3"], ds["Correct"] == ds["Option3"], 2, correctOption),
        _buildOption(
            ds["Option4"], ds["Correct"] == ds["Option4"], 3, correctOption),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 7),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _showAnswer = true;
                  });
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

    if (_showAnswer) {
      if (isSelected && isCorrect) {
        if (_selectedOptionIndex == index) {
          _correctAnswerCount += 10;
          _selectedOptionIndex = -1;
        }
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
      } else if (!isSelected && isCorrect) {
        return const SizedBox();
      } else {
        return const SizedBox();
      }
    } else {
      return GestureDetector(
        onTap: () {
          setState(() {
            _showAnswer = true;
            _selectedOptionIndex = index;
          });
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
