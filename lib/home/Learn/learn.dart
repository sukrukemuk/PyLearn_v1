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
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 27, 27),
      appBar: AppBar(
        backgroundColor: Colors.white,
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
    );
  }
}

class MyImageList extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/images/lesson1.png',
    'assets/images/lesson2.png',
    'assets/images/lesson3.png',
    'assets/images/lesson4.png',
    'assets/images/lesson5.png',
    'assets/images/lesson6.png',
    'assets/images/lesson7.png',
    'assets/images/lesson8.png',
    'assets/images/lesson9.png',
    'assets/images/lesson10.png',
    'assets/images/lesson11.png',
    'assets/images/lesson12.png',
    'assets/images/lesson13.png',
    'assets/images/lesson14.png',
    'assets/images/lesson15.png',
  ];

  final List<String> imageDescriptions = [
    'Sayı Veri Tipleri: Integer ve Float',
    'Matematiksel Operatörler',
    'Değişken Tanımlama',
    'Veri Tipi Dönüşümleri',
    'Karakter Dizileri: Strings',
    'Listeler',
    'Tuple',
    'Sets',
    'Dictionary',
    'Değer ve Referans Türleri',
    'Operatörler',
    'Koşul İfadeleri',
    'Döngüler',
    'Fonksiyonlar',
    'Nesne Tabanlı Programlama',
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
          onTap: () {
            navigateToLesson(context, index);
          },
        );
      },
    );
  }

  void navigateToLesson(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Lesson1()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Lesson2()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Lesson3()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Lesson4()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Lesson5()),
        );
        break;
      case 5:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Lesson6()),
        );
        break;
      case 6:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Lesson7()),
        );
        break;
      case 7:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Lesson8()),
        );
        break;
      case 8:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Lesson9()),
        );
        break;
      case 9:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Lesson10()),
        );
        break;
      case 10:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Lesson11()),
        );
        break;
      case 11:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Lesson12()),
        );
        break;
      case 12:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Lesson13()),
        );
        break;
      case 13:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Lesson14()),
        );
        break;
      case 14:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Lesson15()),
        );
        break;
      default:
        break;
    }
  }
}

class CustomCard extends StatelessWidget {
  final ImageProvider<Object> image;
  final String title;
  final VoidCallback onTap;

  const CustomCard({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
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
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Bu ders hakkında detaylı bilgi almak için tıklayınız.',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
