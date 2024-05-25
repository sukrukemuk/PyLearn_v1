import 'package:flutter/material.dart';

class Lesson6 extends StatelessWidget {
  const Lesson6({super.key});

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
          'Listeler',
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
                  'Python Listeler',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Python\'da listeler, birden fazla öğeyi tek bir değişkende saklamanıza olanak tanır. Listeler, farklı veri türlerinden öğeler içerebilir ve değiştirilebilir (mutable) yapıya sahiptir.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Liste Tanımlama ve Erişim',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Liste elemanlarına indeks numaraları ile erişebilirsiniz. Python\'da indeksler 0\'dan başlar:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'fruits = ["apple", "banana", "cherry"]\n'
                    'print(fruits[0])  # "apple"\n'
                    'print(fruits[1])  # "banana"\n'
                    'print(fruits[2])  # "cherry"',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Liste Elemanlarını Değiştirme',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Liste elemanlarını indeks numarası ile değiştirilebilir:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'fruits = ["apple", "banana", "cherry"]\n'
                    'fruits[1] = "blueberry"\n'
                    'print(fruits)  # ["apple", "blueberry", "cherry"]',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Liste Metotları',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Python, listelerle çalışmak için birçok yerleşik metot sağlar:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                const Text(
                  'append()',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'append() metodu, listenin sonuna yeni bir eleman ekler:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'fruits = ["apple", "banana", "cherry"]\n'
                    'fruits.append("orange")\n'
                    'print(fruits)  # ["apple", "banana", "cherry", "orange"]',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'insert()',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'insert() metodu, belirtilen bir pozisyona yeni bir eleman ekler:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'fruits = ["apple", "banana", "cherry"]\n'
                    'fruits.insert(1, "blueberry")\n'
                    'print(fruits)  # ["apple", "blueberry", "banana", "cherry"]',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'remove()',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'remove() metodu, belirtilen değere sahip ilk elemanı listeden kaldırır:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'fruits = ["apple", "banana", "cherry"]\n'
                    'fruits.remove("banana")\n'
                    'print(fruits)  # ["apple", "cherry"]',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'pop()',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'pop() metodu, belirtilen pozisyondaki elemanı listeden çıkarır ve döndürür. Eğer pozisyon belirtilmezse, son eleman çıkarılır:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'fruits = ["apple", "banana", "cherry"]\n'
                    'fruit = fruits.pop(1)\n'
                    'print(fruit)   # "banana"\n'
                    'print(fruits)  # ["apple", "cherry"]',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'sort()',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'sort() metodu, liste elemanlarını belirli bir sıraya göre sıralar:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'fruits = ["cherry", "apple", "banana"]\n'
                    'fruits.sort()\n'
                    'print(fruits)  # ["apple", "banana", "cherry"]',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Liste Dilimleme',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Listelerin belirli bir kısmını dilimlemek için dilimleme (slicing) işlemi kullanılır:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'fruits = ["apple", "banana", "cherry", "date", "fig"]\n'
                    'print(fruits[1:3])  # ["banana", "cherry"]\n'
                    'print(fruits[:2])   # ["apple", "banana"]\n'
                    'print(fruits[3:])   # ["date", "fig"]',
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
