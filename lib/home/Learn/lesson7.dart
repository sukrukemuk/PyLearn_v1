import 'package:flutter/material.dart';

class Lesson7 extends StatelessWidget {
  const Lesson7({super.key});

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
          'Tuple',
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
                  'Python Tuple',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Python\'da bir tuple, değiştirilemez (immutable) bir veri yapısıdır. Tıpkı listeler gibi birden çok öğeyi tek bir değişkende saklar, ancak tuple elemanlarına sonradan müdahale edilemez.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Tuple Tanımlama ve Erişim',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Tuple, () parantezleri içinde virgülle ayrılmış öğelerle tanımlanır. Tuple elemanlarına indeks numaraları ile erişilebilir:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'fruits = ("apple", "banana", "cherry")\n'
                    'print(fruits[0])  # "apple"\n'
                    'print(fruits[1])  # "banana"\n'
                    'print(fruits[2])  # "cherry"',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Tuple Elemanlarını Değiştirmek',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Tuple elemanlarını değiştirmek mümkün değildir. Bu yüzden, tuple oluşturulduktan sonra içeriği değiştirilemez:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'fruits = ("apple", "banana", "cherry")\n'
                    'fruits[1] = "blueberry"  # Hata!',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Tuple Metotları ve Operasyonları',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Tuple, değiştirilemez olduğu için listelerdeki gibi ekstra metotları ve operasyonları desteklemez. Ancak, bazı temel operasyonlar kullanılabilir:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'fruits = ("apple", "banana", "cherry")\n'
                    'print(len(fruits))  # 3\n'
                    'print("banana" in fruits)  # True\n'
                    'print(fruits.index("cherry"))  # 2',
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
