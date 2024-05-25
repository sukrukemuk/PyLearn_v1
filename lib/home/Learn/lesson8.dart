import 'package:flutter/material.dart';

class Lesson8 extends StatelessWidget {
  const Lesson8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          'Sets',
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Python Sets',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Python\'da bir set, benzersiz öğelerin bir koleksiyonudur. Set\'ler, sırasızdır ve bir öğenin sadece bir kez bulunabileceği bir veri yapısıdır.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Set Tanımlama ve Erişim',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Bir set, {} süslü parantezler arasında virgülle ayrılmış öğelerle tanımlanır. Set\'ler, indekslenemez, bu nedenle öğelere indeks numarası ile erişilemez.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'fruits = {"apple", "banana", "cherry"}\n'
                    'print(fruits)  # {"apple", "banana", "cherry"}',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Set Elemanlarına Ekleme ve Çıkarma',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Bir set\'e yeni bir öğe eklemek için add() metodu kullanılır. Bir öğeyi set\'ten çıkarmak için remove() veya discard() metodu kullanılabilir:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'fruits = {"apple", "banana", "cherry"}\n'
                    'fruits.add("orange")\n'
                    'print(fruits)  # {"apple", "banana", "cherry", "orange"}\n'
                    'fruits.remove("banana")\n'
                    'print(fruits)  # {"apple", "cherry", "orange"}',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Set Metotları',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Python, set\'lerle çalışmak için birçok yerleşik metot sağlar:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                const Text(
                  'union()',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'İki set\'in birleşimini döndürür:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'set1 = {"apple", "banana", "cherry"}\n'
                    'set2 = {"orange", "mango", "apple"}\n'
                    'print(set1.union(set2))  # {"apple", "banana", "cherry", "orange", "mango"}',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'intersection()',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'İki set\'in kesişimini döndürür:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'set1 = {"apple", "banana", "cherry"}\n'
                    'set2 = {"orange", "mango", "apple"}\n'
                    'print(set1.intersection(set2))  # {"apple"}',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'difference()',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Bir set\'in diğerinden farkını döndürür:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'set1 = {"apple", "banana", "cherry"}\n'
                    'set2 = {"orange", "mango", "apple"}\n'
                    'print(set1.difference(set2))  # {"banana", "cherry"}',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
