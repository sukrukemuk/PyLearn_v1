import 'package:flutter/material.dart';

class Lesson3 extends StatelessWidget {
  const Lesson3({super.key});

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
          'Değişken Tanımlama',
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
                  'Değişken Tanımlama',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Python\'da değişkenler, veri saklamak için isimlendirilmiş yer tutuculardır. Değişken tanımlarken, değişkene bir isim verilir ve bu isim kullanılarak değere erişilir veya değer değiştirilir.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Değişken Tanımlama Kuralları',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  '1. Değişken isimleri harf (a-z, A-Z), rakam (0-9) ve alt çizgi (_) karakterlerinden oluşabilir.\n'
                  '2. Değişken isimleri bir rakam ile başlayamaz.\n'
                  '3. Büyük/küçük harf duyarlıdır (age ve Age farklı değişkenlerdir).\n'
                  '4. Anahtar kelimeler (if, for, while, vb.) değişken ismi olarak kullanılamaz.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Değişken Tanımlama Örnekleri',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Aşağıda, Python\'da çeşitli veri türleriyle değişken tanımlama örnekleri verilmiştir:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'x = 5  # Integer\n'
                    'y = 3.14  # Float\n'
                    'name = "Alice"  # String\n'
                    'is_student = True  # Boolean\n'
                    'colors = ["red", "green", "blue"]  # List\n'
                    'point = (10, 20)  # Tuple\n'
                    'unique_numbers = {1, 2, 3}  # Set\n'
                    'person = {"name": "Bob", "age": 25}  # Dictionary',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Değişken Değerini Güncelleme',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Bir değişken tanımlandıktan sonra, aynı değişkeni kullanarak değerini güncelleyebilirsiniz.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'x = 10\n'
                    'print(x)  # 10\n\n'
                    'x = 20\n'
                    'print(x)  # 20',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Değişken Türünü Öğrenme',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Python\'da type() fonksiyonu kullanılarak bir değişkenin türünü öğrenebilirsiniz.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'x = 5\n'
                    'print(type(x))  # <class \'int\'>\n\n'
                    'y = 3.14\n'
                    'print(type(y))  # <class \'float\'>\n\n'
                    'name = "Alice"\n'
                    'print(type(name))  # <class \'str\'>\n\n'
                    'is_student = True\n'
                    'print(type(is_student))  # <class \'bool\'>',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Çoklu Değişken Tanımlama',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Python, aynı satırda birden fazla değişkeni tanımlamanıza ve değer atamanıza izin verir.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'a, b, c = 5, 10, 15\n'
                    'print(a)  # 5\n'
                    'print(b)  # 10\n'
                    'print(c)  # 15',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Değişkenlerin Değerlerini Değiştirme',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'İki değişkenin değerlerini kolayca değiştirebilirsiniz.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'a = 5\n'
                    'b = 10\n\n'
                    'a, b = b, a\n'
                    'print(a)  # 10\n'
                    'print(b)  # 5',
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
