import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pylearn_v1/auth/views/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLogoWidget extends StatelessWidget {
  const MyLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 32, bottom: 14),
      child: SvgPicture.asset(
        'assets/icons/copyright.svg',
        width: 140,
        height: 140,
      ),
    );
  }
}

class AccountDeletionScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AccountDeletionScreen({super.key});

  Future<void> _deleteAccount(BuildContext context) async {
  }

  Future<void> _changePassword(BuildContext context) async {
    try {
      final user = _auth.currentUser;
      if (user != null && user.email != null) {
        await _auth.sendPasswordResetEmail(email: user.email!);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Şifre sıfırlama bağlantısı e-posta adresinize gönderildi.',
              style: TextStyle(fontSize: 13, color: Colors.white),
            ),
            backgroundColor: Colors.black,
          ),
        );
      } else {
        throw Exception(
            'Kullanıcı bulunamadı veya e-posta adresi mevcut değil.');
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Şifre sıfırlama işlemi başarısız: $e',
            style: const TextStyle(fontSize: 13, color: Colors.red),
          ),
          backgroundColor: Colors.black,
        ),
      );
    }
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
          'Ayarlar',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const MyLogoWidget(),
            ElevatedButton(
              onPressed: () => _deleteAccount(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: const Size(150, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(
                'Hesabı Sil',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _changePassword(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: const Size(150, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(
                'Şifreni Değiştir',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _auth.signOut();
                final prefs = await SharedPreferences.getInstance();
                await prefs.clear();
                Navigator.pushAndRemoveUntil(
                  // ignore: use_build_context_synchronously
                  context,
                  MaterialPageRoute(builder: (context) => const SignIn()),
                  (Route<dynamic> route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: const Size(150, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(
                'Çıkış Yap',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
