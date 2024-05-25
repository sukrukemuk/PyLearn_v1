import 'package:flutter/material.dart';

class Lesson11 extends StatelessWidget {
  const Lesson11({super.key});

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
          'Operatörler',
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
                  'Python Operatörleri',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Python\'da birçok operatör bulunmaktadır. Bu operatörler, aritmetik, karşılaştırma, atama, mantıksal ve diğer çeşitli işlemler için kullanılır.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Aritmetik Operatörler',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Aritmetik operatörler, matematiksel işlemler için kullanılır.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'a = 10\n'
                    'b = 5\n'
                    'print("Toplama:", a + b)\n'
                    'print("Çıkarma:", a - b)\n'
                    'print("Çarpma:", a * b)\n'
                    'print("Bölme:", a / b)\n'
                    'print("Üs alma:", a ** b)\n'
                    'print("Mod alma:", a % b)',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Karşılaştırma Operatörleri',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Karşılaştırma operatörleri, değerleri karşılaştırmak için kullanılır ve genellikle koşullu ifadelerde kullanılır.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'x = 10\n'
                    'y = 5\n'
                    'print("Eşit mi?", x == y)\n'
                    'print("Eşit değil mi?", x != y)\n'
                    'print("Büyük mü?", x > y)\n'
                    'print("Küçük mü?", x < y)\n'
                    'print("Büyük veya eşit mi?", x >= y)\n'
                    'print("Küçük veya eşit mi?", x <= y)',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Mantıksal Operatörler',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Mantıksal operatörler, mantıksal işlemler yapmak için kullanılır ve genellikle koşullu ifadelerde kullanılır.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'p = True\n'
                    'q = False\n'
                    'print("AND:", p and q)\n'
                    'print("OR:", p or q)\n'
                    'print("NOT:", not p)',
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
