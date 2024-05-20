import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pylearn_v1/home/homepage.dart';
import 'package:pylearn_v1/home/quiz/question.dart';

class Quizzes extends StatefulWidget {
  const Quizzes({super.key});

  @override
  State<Quizzes> createState() => _QuizzesState();
}

class _QuizzesState extends State<Quizzes> {
  late Map<String, dynamic> userData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getUserData();
    // Call the function here
    getCompletedQuizCount();
  }

  Future<void> getUserData() async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      var snapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      setState(() {
        userData = snapshot.data() ?? {};
        isLoading = false;
      });
    } catch (e) {
      // ignore: avoid_print
      print("Kullanıcı verileri alınamadı: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> getCompletedQuizCount() async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot snapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      Map<String, dynamic>? completedQuizzes =
          (snapshot.data() as Map<String, dynamic>?)?['completed_quizzes'];
      // ignore: unnecessary_type_check
      if (completedQuizzes != null) {
        completedQuizzes.forEach((key, value) {
          // ignore: avoid_print
          print('$key: $value');
        });
      }
    } catch (e) {
      // ignore: avoid_print
      print('Hata: Tamamlanan quiz içeriğini alırken bir hata oluştu: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 27, 27),
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
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
              (Route<dynamic> route) => false,
            );
          },
          color: Colors.black,
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              padding: const EdgeInsets.all(10),
              children: [
                // ignore: unnecessary_null_comparison
                if (userData != null)
                  ..._buildQuizCards(),
              ],
            ),
    );
  }

  List<Widget> _buildQuizCards() {
    return [
      buildQuizCard(
        context,
        "temelseviye1",
        "assets/images/1.png",
      ),
      buildQuizCard(
        context,
        "temelseviye2",
        "assets/images/2.png",
      ),
      buildQuizCard(
        context,
        "kolayseviye1",
        "assets/images/3.png",
      ),
      buildQuizCard(
        context,
        "kolayseviye2",
        "assets/images/1.png",
      ),
      buildQuizCard(
        context,
        "ortaseviye1",
        "assets/images/2.png",
      ),
      buildQuizCard(
        context,
        "ortaseviye2",
        "assets/images/3.png",
      ),
      buildQuizCard(
        context,
        "zorseviye1",
        "assets/images/2.png",
      ),
      buildQuizCard(
        context,
        "zorseviye2",
        "assets/images/3.png",
      ),
      buildQuizCard(
        context,
        "genel1",
        "assets/images/1.png",
      ),
      buildQuizCard(
        context,
        "genel2",
        "assets/images/2.png",
      ),
    ];
  }

  Widget buildQuizCard(
      BuildContext context, String category, String imagePath) {
    bool isQuizCompleted = false;

    if (userData.containsKey('completed_quizzes')) {
      Map<String, dynamic>? completedQuizzes = userData['completed_quizzes'];
      if (completedQuizzes != null && completedQuizzes.containsKey(category)) {
        isQuizCompleted = true;
      }
    }

    bool isQuizEnabled;
    if (category == 'temelseviye1') {
      isQuizEnabled = true;
    } else if (category == 'temelseviye2') {
      isQuizEnabled = isQuizCompleted ||
          (userData.containsKey('completed_quizzes') &&
              userData['completed_quizzes']!.containsKey(
                  'temelseviye1'));
    } else if (category == 'kolayseviye1' ||
        category == 'kolayseviye2' ||
        category == 'ortaseviye1' ||
        category == 'ortaseviye2' ||
        category == 'zorseviye1' ||
        category == 'zorseviye2' ||
        category == 'genel1' ||
        category == 'genel2') {
      String previousCategory = _getPreviousCategory(category);
      if (previousCategory.isNotEmpty) {
        isQuizEnabled = userData.containsKey('completed_quizzes') &&
            userData['completed_quizzes']!.containsKey(previousCategory);
      } else {
        isQuizEnabled =
            false;
      }
    } else {
      isQuizEnabled = false;
    }

    return GestureDetector(
      onTap: isQuizEnabled
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Questions(
                    category: category,
                  ),
                ),
              );
            }
          : () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Lütfen önceki quizleri tamamlayın.',
                    style: TextStyle(fontSize: 13, color: Colors.red),
                  ),
                  backgroundColor: Colors.black,
                ),
              );
            },
      child: Stack(
        children: [
          Container(
            height: 200,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: isQuizEnabled
                  ? const Color.fromARGB(255, 212, 214, 219)
                  : Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (!isQuizEnabled)
            const Positioned(
              top: 0,
              right: 0,
              child: Icon(
                Icons.lock,
                size: 48,
                color: Colors.white,
              ),
            ),
        ],
      ),
    );
  }
  String _getPreviousCategory(String category) {
    switch (category) {
      case 'temelseviye2':
        return 'temelseviye1';
      case 'kolayseviye1':
        return 'temelseviye2';
      case 'kolayseviye2':
        return 'kolayseviye1';
      case 'ortaseviye1':
        return 'kolayseviye2';
      case 'ortaseviye2':
        return 'ortaseviye1';
      case 'zorseviye1':
        return 'ortaseviye2';
      case 'zorseviye2':
        return 'zorseviye1';
      case 'genel1':
        return 'zorseviye2';
      case 'genel2':
        return 'genel1';
      default:
        return '';
    }
  }
}
