import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pylearn_v1/home/course/course.dart';
import 'package:pylearn_v1/home/drawer/help.dart';
import 'package:pylearn_v1/home/drawer/options.dart';
import 'package:pylearn_v1/home/drawer/profile.dart';
import 'package:pylearn_v1/home/Learn/learn.dart';
import 'package:pylearn_v1/home/quiz/quiz.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const HomePage());
}

void _openWhatsAppGroup() async {
  var url = Uri.parse("https://chat.whatsapp.com/F0he0oXa8pyGYcsNfLeDyb");
  await launchUrl(url);
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 31, 27, 27),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/logo.svg",
                  width: 45,
                  height: 45,
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.connect_without_contact,
                color: Colors.blue,
                size: 25,
              ),
              onPressed: () {
                _openWhatsAppGroup();
              },
            ),
          ],
        ),
        drawer: const DrawerWidget(),
        body: const CardList(),
      ),
    );
  }
}

class CardList extends StatelessWidget {
  const CardList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10.0),
      children: const <Widget>[
        CustomCard(
          image: AssetImage('assets/images/Notlar.png'),
          title: 'NOTLAR',
          description: 'Sizin için hazırlamış olduğumuz python notları.',
          page: Learn(),
        ),
        CustomCard(
          image: AssetImage('assets/images/Kurslar.png'),
          title: 'KURSLAR',
          description: 'Kurs içeriklerini izleyerek kendinizi geliştirin.',
          page: YoutubePlayerExample(),
        ),
        CustomCard(
          image: AssetImage('assets/images/Quizzes.png'),
          title: 'QUİZZ',
          description: 'Bu quizzleri çözerek kendinizi test edin.',
          page: Quizzes(),
        ),
      ],
    );
  }
}

class CustomCard extends StatelessWidget {
  final ImageProvider<Object> image;
  final String title;
  final String description;
  final Widget page;

  const CustomCard({
    required this.image,
    required this.title,
    required this.description,
    required this.page,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image(
                image: image,
                fit: BoxFit.cover,
              ),
            ),
            ListTile(
              title: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                description,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => page),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              DrawerHeader(
                padding: EdgeInsets.zero,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white, Color.fromARGB(255, 34, 33, 33)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: FutureBuilder<Map<String, dynamic>>(
                  future: getUserData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        alignment: Alignment.center,
                        child: Text(
                          'Hata: ${snapshot.error}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      );
                    } else {
                      String photoUrl = snapshot.data?['profilePhoto'] ?? '';
                      String userName = snapshot.data?['name'] ?? 'Misafir';

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: photoUrl.isNotEmpty
                                  ? NetworkImage(photoUrl)
                                  : const AssetImage('assets/images/splash.png')
                                      as ImageProvider,
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 70),
                                  child: Text(
                                    '$userName ',
                                    style: GoogleFonts.josefinSans(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.laptop_mac,
                                  color: Color.fromARGB(255, 0, 255, 81),
                                  size: 24,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
              const ListTileWidget(
                icon: Icons.person,
                title: 'Profil',
                page: ProfileScreen(),
              ),
              const ListTileWidget(
                icon: Icons.help_center,
                title: 'Yardım',
                page: HelpPage(),
              ),
              ListTileWidget(
                icon: Icons.settings,
                title: 'Ayarlar',
                page: AccountDeletionScreen(),
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Çıkış Yap'),
                onTap: () {
                  exit(0);
                },
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(),
            child: SvgPicture.asset(
              'assets/icons/copyright.svg',
              width: 50,
              height: 50,
            ),
          ),
        ],
      ),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget page;

  const ListTileWidget({
    required this.icon,
    required this.title,
    required this.page,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}

Future<Map<String, dynamic>> getUserData() async {
  Map<String, dynamic> userData = {};
  try {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    var snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    userData = snapshot.data() ?? {};
  } catch (e) {
    // ignore: avoid_print
    print("Kullanıcı verisi alınamadı: $e");
  }
  return userData;
}
