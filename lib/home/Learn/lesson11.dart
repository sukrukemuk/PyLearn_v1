import 'package:flutter/material.dart';

class Lesson11 extends StatelessWidget {
  const Lesson11({super.key});

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
          'Veriler ve Sözdizimleri',
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
                'Python Veri Türleri ve Sözdizimi',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Python, kullanımı kolay ve anlaşılır bir sözdizimine sahip bir programlama dilidir. Python\'da kullanılan temel veri tipleri şunlardır:\n\n'
                '- Sayılar: Tam sayılar (int), ondalık sayılar (float), karmaşık sayılar\n'
                '- Metin: String\n'
                '- Boole: True veya False\n'
                '- Listeler\n'
                '- Demetler (Tuples)\n'
                '- Sözlükler (Dictionaries)\n\n'
                'Python\'da, kod blokları girintilendirme ile ayrılır. Ayrıca, birçok dilde olduğu gibi koşullu ifadeler (if-else), döngüler (for, while) ve fonksiyonlar gibi yapılar da bulunur.\n\n'
                'Örneklerle:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '// Koşullu İfadeler\n'
                'if condition:\n'
                '    # Kod bloğu\n'
                'elif another_condition:\n'
                '    # Başka bir kod bloğu\n'
                'else:\n'
                '    # Diğer durum için kod bloğu\n\n'
                '// Döngüler\n'
                'for item in iterable:\n'
                '    # Kod bloğu\n\n'
                'while condition:\n'
                '    # Kod bloğu\n\n'
                '// Fonksiyonlar\n'
                'def function_name(parameters):\n'
                '    # Fonksiyonun yapacağı işlemler\n'
                '    return result',
                style: TextStyle(fontSize: 16, fontFamily: 'Courier'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
