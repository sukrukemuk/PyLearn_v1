import 'package:flutter/material.dart';

class Lesson10 extends StatelessWidget {
  const Lesson10({super.key});

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
          'Değer ve Referans Türleri',
          style: TextStyle(
            fontSize: 20,
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Python\'da Değer ve Referans Türleri',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Python\'da, değişkenlerin değer veya referans türlerine sahip olduğu önemlidir. Değer türleri doğrudan değerlerini tutarlar, ancak referans türleri bellekte adreslerini gösterirler.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Değer Türleri (Value Types)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Değer türlerinde, değişkenin kendisi, değeri içerir. Bu nedenle, bir değişkenin değeri kopyalandığında, orijinal değişken etkilenmez.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Örnek (Value Type):',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.black,
              child: const Text(
                'x = 10\ny = x\nx = 20\nprint(y)  # Çıktı: 10',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Referans Türleri (Reference Types)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Referans türlerinde, değişken, bellekteki bir nesnenin adresini içerir. Dolayısıyla, bir değişkenin referansı kopyalandığında, aynı nesneye işaret edilir ve değişiklikler her iki değişkende de etkilenir.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Örnek (Reference Type):',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.black,
              child: const Text(
                'list1 = [1, 2, 3]\nlist2 = list1\nlist1.append(4)\nprint(list2)  # Çıktı: [1, 2, 3, 4]',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

