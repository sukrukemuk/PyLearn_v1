import 'package:flutter/material.dart';

class Lesson14 extends StatelessWidget {
  const Lesson14({super.key});

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
          'Fonksiyonlar',
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
                'Fonksiyonlar',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Dart dilinde, fonksiyonlar tekrar kullanılabilir kod bloklarıdır ve belirli bir işlevi gerçekleştirmek için kullanılırlar.\n\n'
                'Fonksiyonlar, bir isimle tanımlanır ve gerektiğinde çağrılabilirler. Fonksiyonlar, parametreleri alabilir ve bir değer döndürebilirler.\n\n'
                'Örneğin, aşağıdaki gibi bir toplama fonksiyonu tanımlayabiliriz:\n\n'
                'int toplama(int sayi1, int sayi2) {\n'
                '  return sayi1 + sayi2;\n'
                '}\n\n'
                'Bu fonksiyon, iki parametre alır (sayi1 ve sayi2) ve bu parametrelerin toplamını döndürür.\n\n'
                'Fonksiyonlar, bir kod bloğunu tekrar tekrar yazmaktan kaçınmak ve kodunuzu daha modüler hale getirmek için çok kullanışlıdır.\n\n'
                '// Örnek: Toplama fonksiyonunu kullanma\n'
                'int sonuc = toplama(5, 3);\n'
                'print(\'Toplam: \$sonuc\'); // Çıktı: Toplam: 8',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int toplama(int sayi1, int sayi2) {
    return sayi1 + sayi2;
  }
}
