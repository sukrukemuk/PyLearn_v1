import 'package:flutter/material.dart';

class Lesson12 extends StatelessWidget {
  const Lesson12({super.key});

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
          'Koşul İfadeleri',
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
                  'Python Koşul İfadeleri',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Python\'da koşul ifadeleri, bir şartın doğru veya yanlış olmasına göre belirli işlemlerin yapılmasını sağlar.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'if-else Yapısı',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'if-else yapısı, bir koşulu kontrol eder ve koşul doğru ise belirli bir bloğu çalıştırır, aksi halde başka bir bloğu çalıştırır.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'x = 10\n'
                    'if x > 5:\n'
                    '    print("x 5\'ten büyük")\n'
                    'else:\n'
                    '    print("x 5\'ten küçük veya eşit")',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'if-elif-else Yapısı',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'if-elif-else yapısı, birden fazla koşulu kontrol eder ve koşulların hangisinin doğru olduğunu belirler. Sadece ilk doğru koşulun bloğunu çalıştırır.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'x = 10\n'
                    'if x > 10:\n'
                    '    print("x 10\'dan büyük")\n'
                    'elif x < 10:\n'
                    '    print("x 10\'dan küçük")\n'
                    'else:\n'
                    '    print("x 10\'a eşit")',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Ternary (Üçlü) Operatör',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Ternary operatörü, bir koşulu tek bir satırda değerlendirir ve sonuca göre bir değer döndürür.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'x = 10\n'
                    'result = "x 10\'dan büyük" if x > 10 else "x 10\'dan küçük veya eşit"\n'
                    'print(result)',
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
