import 'package:flutter/material.dart';

class Lesson2 extends StatelessWidget {
  const Lesson2({super.key});

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
          'Matematiksel Operatörler',
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
                  'Matematiksel Operatörler',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Python\'da matematiksel operatörler, sayısal değerlerle aritmetik işlemler yapmak için kullanılır. Bu operatörler, toplama, çıkarma, çarpma, bölme ve daha fazlasını içerir.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Toplama (+)',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Toplama operatörü iki sayıyı toplamak için kullanılır.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'a = 10\n'
                    'b = 3.5\n'
                    'toplam = a + b  # toplam 13.5 olur',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Çıkarma (-)',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Çıkarma operatörü bir sayıyı diğerinden çıkarmak için kullanılır.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'a = 10\n'
                    'b = 3.5\n'
                    'fark = a - b  # fark 6.5 olur',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Çarpma (*)',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Çarpma operatörü iki sayıyı çarpmak için kullanılır.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'a = 10\n'
                    'b = 3.5\n'
                    'çarpım = a * b  # çarpım 35.0 olur',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Bölme (/)',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Bölme operatörü bir sayıyı diğerine bölmek için kullanılır.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'a = 10\n'
                    'b = 4\n'
                    'bölüm = a / b  # bölüm 2.5 olur',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Tam Sayı Bölme (//)',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Tam sayı bölme operatörü, bölme işleminden sonra sonucu aşağı yuvarlayarak tam sayı döner.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'a = 10\n'
                    'b = 4\n'
                    'tam_bölüm = a // b  # tam_bölüm 2 olur',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Mod Alma (%)',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Mod alma operatörü, bir sayının diğerine bölümünden kalan değeri döner.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'a = 10\n'
                    'b = 4\n'
                    'mod = a % b  # mod 2 olur',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Üs Alma (**)',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Üs alma operatörü, bir sayının diğerinin kuvvetine (üs) yükseltilmesini sağlar.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'a = 2\n'
                    'b = 3\n'
                    'üs = a ** b  # üs 8 olur (2^3)',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Örnekler ve Uygulamalar',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Matematiksel operatörlerin nasıl kullanıldığını daha iyi anlamak için aşağıdaki örneklere göz atın:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    '# Değişken tanımlamaları\n'
                    'x = 15\n'
                    'y = 4\n\n'
                    '# Toplama\n'
                    'print("Toplama:", x + y)  # 19\n\n'
                    '# Çıkarma\n'
                    'print("Çıkarma:", x - y)  # 11\n\n'
                    '# Çarpma\n'
                    'print("Çarpma:", x * y)  # 60\n\n'
                    '# Bölme\n'
                    'print("Bölme:", x / y)  # 3.75\n\n'
                    '# Tam Sayı Bölme\n'
                    'print("Tam Sayı Bölme:", x // y)  # 3\n\n'
                    '# Mod Alma\n'
                    'print("Mod Alma:", x % y)  # 3\n\n'
                    '# Üs Alma\n'
                    'print("Üs Alma:", x ** y)  # 50625',
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
