import 'package:flutter/material.dart';

class Lesson4 extends StatelessWidget {
  const Lesson4({super.key});

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
          'Veri Tipi Dönüşümleri',
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
                  'Veri Tipi Dönüşümleri',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Python\'da, verileri bir veri tipinden başka bir veri tipine dönüştürmek oldukça yaygın bir işlemdir. Bu işlem, bazı durumlarda verileri daha uygun bir formata getirmek veya belirli işlemler yapabilmek için gereklidir.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Temel Dönüştürme Fonksiyonları',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Python, veri tipi dönüşümleri için bazı yerleşik fonksiyonlar sağlar:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                const Text(
                  '1. int() - Bir değeri tamsayıya dönüştürür.\n'
                  '2. float() - Bir değeri ondalık sayıya dönüştürür.\n'
                  '3. str() - Bir değeri string\'e dönüştürür.\n'
                  '4. bool() - Bir değeri boolean\'a dönüştürür.\n'
                  '5. list() - Bir değeri listeye dönüştürür.\n'
                  '6. tuple() - Bir değeri tuple\'a dönüştürür.\n'
                  '7. set() - Bir değeri sete dönüştürür.\n'
                  '8. dict() - Bir değeri sözlüğe dönüştürür.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Örnekler',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Aşağıda, Python\'da veri tipi dönüşümleri ile ilgili bazı örnekler verilmiştir:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    '# int() fonksiyonu kullanımı\n'
                    'a = "123"\n'
                    'b = int(a)\n'
                    'print(b)  # 123\n'
                    'print(type(b))  # <class \'int\'>\n\n'
                    '# float() fonksiyonu kullanımı\n'
                    'x = "3.14"\n'
                    'y = float(x)\n'
                    'print(y)  # 3.14\n'
                    'print(type(y))  # <class \'float\'>\n\n'
                    '# str() fonksiyonu kullanımı\n'
                    'num = 456\n'
                    'text = str(num)\n'
                    'print(text)  # "456"\n'
                    'print(type(text))  # <class \'str\'>\n\n'
                    '# bool() fonksiyonu kullanımı\n'
                    'value = 0\n'
                    'is_true = bool(value)\n'
                    'print(is_true)  # False\n'
                    'print(type(is_true))  # <class \'bool\'>',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'İleri Dönüşümler',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Daha karmaşık veri tipi dönüşümleri, listeleri, tuple\'ları, set\'leri ve dictionary\'leri içerir:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    '# list() fonksiyonu kullanımı\n'
                    't = (1, 2, 3)\n'
                    'l = list(t)\n'
                    'print(l)  # [1, 2, 3]\n'
                    'print(type(l))  # <class \'list\'>\n\n'
                    '# tuple() fonksiyonu kullanımı\n'
                    's = {1, 2, 3}\n'
                    't = tuple(s)\n'
                    'print(t)  # (1, 2, 3)\n'
                    'print(type(t))  # <class \'tuple\'>\n\n'
                    '# set() fonksiyonu kullanımı\n'
                    'l = [1, 2, 2, 3, 3]\n'
                    's = set(l)\n'
                    'print(s)  # {1, 2, 3}\n'
                    'print(type(s))  # <class \'set\'>\n\n'
                    '# dict() fonksiyonu kullanımı\n'
                    'l = [("name", "Alice"), ("age", 30)]\n'
                    'd = dict(l)\n'
                    'print(d)  # {\'name\': \'Alice\', \'age\': 30}\n'
                    'print(type(d))  # <class \'dict\'>',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Dönüşüm Hataları',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Veri tipi dönüşümleri sırasında bazı hatalarla karşılaşabilirsiniz. Örneğin, bir string\'i tamsayıya dönüştürmeye çalıştığınızda, eğer string geçerli bir tamsayı değilse hata alırsınız:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'a = "123abc"\n'
                    'try:\n'
                    '    b = int(a)\n'
                    'except ValueError:\n'
                    '    print("Hata: Geçersiz tamsayı değeri")\n\n'
                    'c = "3.14.15"\n'
                    'try:\n'
                    '    d = float(c)\n'
                    'except ValueError:\n'
                    '    print("Hata: Geçersiz ondalık sayı değeri")',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Bu örneklerde, dönüşüm işlemleri sırasında oluşabilecek hataları yakalamak için try-except bloğu kullanılmıştır.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
