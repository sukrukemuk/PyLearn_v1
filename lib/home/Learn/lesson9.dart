import 'package:flutter/material.dart';

class Lesson9 extends StatelessWidget {
  const Lesson9({super.key});

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
          'Dictionary',
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
                  'Python Dictionary',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Python\'da bir sözlük, anahtar-değer çiftlerini saklayan bir koleksiyondur. Sözlükler, {} süslü parantezler içinde tanımlanır ve her bir anahtarın bir değeri vardır.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Dictionary Tanımlama ve Erişim',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Bir sözlük, {} süslü parantezler içinde anahtar-değer çiftleriyle tanımlanır. Sözlük elemanlarına anahtarlarını kullanarak erişilebilir.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'person = {\n'
                    '    "name": "Alice",\n'
                    '    "age": 30,\n'
                    '    "city": "New York"\n'
                    '}\n'
                    'print(person["name"])  # "Alice"\n'
                    'print(person["age"])  # 30\n'
                    'print(person["city"])  # "New York"',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Dictionary Elemanlarına Ekleme ve Çıkarma',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Bir sözlüğe yeni bir anahtar-değer çifti eklemek için, sözlük adıyla birlikte yeni bir anahtar ataması yapılır. Bir anahtarı sözlükten çıkarmak için del anahtar_kelimesi kullanılır.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'person = {\n'
                    '    "name": "Alice",\n'
                    '    "age": 30,\n'
                    '    "city": "New York"\n'
                    '}\n'
                    'person["job"] = "Engineer"\n'
                    'del person["age"]\n'
                    'print(person)  # {"name": "Alice", "city": "New York", "job": "Engineer"}',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Dictionary Metotları',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Python, sözlüklerle çalışmak için birçok yerleşik metot sağlar:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                const Text(
                  'keys()',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Sözlükteki tüm anahtarları içeren bir view objesi döndürür:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'person = {\n'
                    '    "name": "Alice",\n'
                    '    "age": 30,\n'
                    '    "city": "New York"\n'
                    '}\n'
                    'print(person.keys())  # dict_keys(["name", "age", "city"])',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'values()',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Sözlükteki tüm değerleri içeren bir view objesi döndürür:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'person = {\n'
                    '    "name": "Alice",\n'
                    '    "age": 30,\n'
                    '    "city": "New York"\n'
                    '}\n'
                    'print(person.values())  # dict_values(["Alice", 30, "New York"])',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'items()',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Sözlükteki tüm anahtar-değer çiftlerini içeren bir view objesi döndürür:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'person = {\n'
                    '    "name": "Alice",\n'
                    '    "age": 30,\n'
                    '    "city": "New York"\n'
                    '}\n'
                    'print(person.items())  # dict_items([("name", "Alice"), ("age", 30), ("city","New York")])',
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
