import 'package:flutter/material.dart';

class Lesson2 extends StatelessWidget {
  const Lesson2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Color.fromARGB(255, 34, 33, 33)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Text(
          'Veri Türleri',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 30),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Python Veri Türleri',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Python, birden çok veri türü sunar. Bazı temel veri türleri şunlardır:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '1. Sayılar:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                '- İnteger (Tam Sayılar): Örneğin, 5, -3, 100. İnteger sayılar aritmetik işlemlerde kullanılır.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Float (Ondalık Sayılar): Örneğin, 3.14, -0.001, 2.5. Ondalık sayılar kesirli veya reel sayıları ifade etmek için kullanılır.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '2. Metin:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                '- String: Karakterlerin bir dizisi. Örneğin, "Merhaba", "Dünya", "123". Metin veri türü metin işlemleri ve metin içeriğinin saklanması için kullanılır.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '3. Boolean:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                '- True veya False değerlerini alabilen bir veri türüdür. Mantıksal ifadeleri değerlendirmek ve kontrol etmek için kullanılır.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '4. Listeler:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                '- Sıralı, değiştirilebilir ve birden çok veri öğesini içerebilirler. Örneğin, [1, 2, 3], ["elma", "armut", "kiraz"]. Liste veri türü veri koleksiyonlarını saklamak ve işlemek için kullanılır.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '5. Demetler (Tuples):',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                '- Sıralı ve değiştirilemez veri koleksiyonlarıdır. Örneğin, (1, 2, 3), ("a", "b", "c"). Demet veri türü genellikle sabit verileri saklamak için kullanılır.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '6. Sözlükler (Dictionaries):',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                '- Anahtar-değer çiftlerini içeren bir veri yapısıdır. Örneğin, {"ad": "Ali", "yas": 25}. Sözlük veri türü veri ilişkilerini modellemek için kullanılır.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Ve daha pek çok veri türü bulunmaktadır. Bu veri türleri, Python programlamada yaygın olarak kullanılmaktadır ve farklı programlama problemlerini çözmek için kullanılabilirler.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
