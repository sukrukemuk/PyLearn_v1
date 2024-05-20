import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  // ignore: non_constant_identifier_names
  Future AddQuizCategory(
      Map<String, dynamic> userQuizCategory, String category) async {
    return await FirebaseFirestore.instance
        .collection(category)
        .add(userQuizCategory);
  }

  Future<void> storeQuizScore(String uid, String category, int score) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'quiz_scores.$category': score,
      });
    } catch (e) {
      // ignore: avoid_print
      print('Hata: Quiz puanı güncellenirken bir hata oluştu: $e');
      rethrow;
    }
  }

  Future<void> markQuizCompleted(String uid, String category) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .update({'completed_quizzes.$category': true});
    } catch (e) {
      // ignore: avoid_print
      print('Hata: Quiz tamamlandı işareti gönderirken hata oluştu: $e');
      rethrow;
    }
  }

  Future<Stream<QuerySnapshot>> getCategoryQuiz(String category) async {
    return FirebaseFirestore.instance.collection(category).snapshots();
  }
}
