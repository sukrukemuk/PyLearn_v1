import 'package:flutter/material.dart';

class Lesson4 extends StatelessWidget {
  const Lesson4({super.key});

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
          'Koşullu İfadeler ve Döngüler',
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
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Koşullu İfadeler ve Döngüler',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Dart dilinde, koşullu ifadeler ve döngüler program akışını kontrol etmek için kullanılır.\n\n'
                '1. Koşullu İfadeler:\n'
                '   - "if", "else if" ve "else" ifadeleri, belirli koşullara bağlı olarak farklı kod bloklarını çalıştırmak için kullanılır.\n\n'
                '2. Döngüler:\n'
                '   - "for" döngüsü: Belirli bir aralıktaki veya bir liste üzerindeki öğeleri tekrarlamak için kullanılır.\n'
                '   - "while" döngüsü: Bir koşul sağlandığı sürece bir kod bloğunu tekrarlamak için kullanılır.\n'
                '   - "do-while" döngüsü: Kod bloğunu en az bir kez çalıştırmak ve ardından koşul sağlandığı sürece tekrarlamak için kullanılır.\n\n'
                'İşte birkaç örnek:\n\n'
                '// Koşullu ifadeler\n'
                'int x = 10;\n'
                'if (x > 5) {\n'
                '  print(\'x 5\'ten büyüktür.\');\n'
                '} else {\n'
                '  print(\'x 5\'ten küçük veya eşittir.\');\n'
                '}\n\n'
                '// else if kullanımı\n'
                'int y = 7;\n'
                'if (y > 10) {\n'
                '  print(\'y 10\'dan büyüktür.\');\n'
                '} else if (y > 5) {\n'
                '  print(\'y 5\'ten büyüktür ama 10\'dan küçüktür.\');\n'
                '} else {\n'
                '  print(\'y 5\'ten küçük veya eşittir.\');\n'
                '}\n\n'
                '// Döngüler\n'
                '// for döngüsü\n'
                'for (int i = 0; i < 5; i++) {\n'
                '  print(\'Döngü \$i\'); // <- \$ işareti ile değişken değerini yazdırıyoruz\n'
                '}\n\n'
                '// while döngüsü\n'
                'int z = 0;\n'
                'while (z < 3) {\n'
                '  print(\'While döngüsü: \$z\');\n'
                '  z++;\n'
                '}\n\n'
                '// do-while döngüsü\n'
                'int w = 0;\n'
                'do {\n'
                '  print(\'Do-while döngüsü: \$w\');\n'
                '  w++;\n'
                '} while (w < 3);\n',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
