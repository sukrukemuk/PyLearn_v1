import 'package:flutter/material.dart';
import 'package:pylearn_v1/home/Learn/lesson1.dart';
import 'package:pylearn_v1/home/Learn/lesson2.dart';
import 'package:pylearn_v1/home/Learn/lesson10.dart';
import 'package:pylearn_v1/home/Learn/lesson11.dart';
import 'package:pylearn_v1/home/Learn/lesson12.dart';
import 'package:pylearn_v1/home/Learn/lesson13.dart';
import 'package:pylearn_v1/home/Learn/lesson14.dart';
import 'package:pylearn_v1/home/Learn/lesson15.dart';
import 'package:pylearn_v1/home/Learn/lesson3.dart';
import 'package:pylearn_v1/home/Learn/lesson4.dart';
import 'package:pylearn_v1/home/Learn/lesson5.dart';
import 'package:pylearn_v1/home/Learn/lesson6.dart';
import 'package:pylearn_v1/home/Learn/lesson7.dart';
import 'package:pylearn_v1/home/Learn/lesson8.dart';
import 'package:pylearn_v1/home/Learn/lesson9.dart';

class Learn extends StatelessWidget {
  const Learn({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
            'Notlar',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, size: 30),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: MyImageList(),
      ),
    );
  }
}

class MyImageList extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/images/fonction.jpg',
    'assets/images/variables.png',
    'assets/images/grammar.jpg',
    'assets/images/loops.jpg',
    'assets/images/fonction.jpg',
    'assets/images/fonction.jpg',
    'assets/images/variables.png',
    'assets/images/grammar.jpg',
    'assets/images/loops.jpg',
    'assets/images/fonction.jpg',
    'assets/images/fonction.jpg',
    'assets/images/variables.png',
    'assets/images/grammar.jpg',
    'assets/images/loops.jpg',
    'assets/images/fonction.jpg',
  ];

  final List<String> imageDescriptions = [
    'Nesne Yönelimli Programlama (OOP)',
    'Veri Türleri',
    'Söz Dizimi',
    'Döngüler',
    'Fonksiyonlar',
    'Nesne Yönelimli Programlama (OOP)',
    'Veri Türleri',
    'Söz Dizimi',
    'Döngüler',
    'Fonksiyonlar',
    'Nesne Yönelimli Programlama (OOP)',
    'Veri Türleri',
    'Söz Dizimi',
    'Döngüler',
    'Fonksiyonlar',
  ];
  MyImageList({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: imagePaths.length,
      itemBuilder: (BuildContext context, int index) {
        return CustomCard(
          image: AssetImage(imagePaths[index]),
          title: imageDescriptions[index],
          description: 'Bu ders hakkında detaylı bilgi almak için tıklayınız.',
          page: getPageByIndex(index),
        );
      },
    );
  }

  Widget getPageByIndex(int index) {
    switch (index) {
      case 0:
        return const Lesson1();
      case 1:
        return const Lesson2();
      case 2:
        return const Lesson3();
      case 3:
        return const Lesson4();
      case 4:
        return const Lesson5();
      case 5:
        return const Lesson6();
      case 6:
        return const Lesson7();
      case 7:
        return const Lesson8();
      case 8:
        return const Lesson9();
      case 9:
        return const Lesson10();
      case 10:
        return const Lesson11();
      case 11:
        return const Lesson12();
      case 12:
        return const Lesson13();
      case 13:
        return const Lesson14();
      case 14:
        return const Lesson15();
      default:
        return Container();
    }
  }
}

class CustomCard extends StatelessWidget {
  final ImageProvider<Object> image;
  final String title;
  final String description;
  final Widget page;

  const CustomCard(
      {super.key,
      required this.image,
      required this.title,
      required this.description,
      required this.page});

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
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
