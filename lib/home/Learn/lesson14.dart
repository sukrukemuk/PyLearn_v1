import 'package:flutter/material.dart';

class Lesson14 extends StatelessWidget {
  const Lesson14({super.key});

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
          'Fonksiyonlar',
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
                  'Python Fonksiyonları',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Python\'da fonksiyonlar, belirli bir görevi yerine getiren ve tekrar tekrar kullanılabilen bloklar halinde kod parçacıklarıdır. Fonksiyonlar, kodunuzu daha modüler hale getirir ve tekrar kullanılabilirliği artırır.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Fonksiyon Tanımlama',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Fonksiyonlar "def" anahtar kelimesi ile tanımlanır ve parametreler alabilir veya almayabilir.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                const Text(
                  'def fonksiyon_adı(parametreler):',
                  style: TextStyle(fontSize: 16),
                ),
                const Text(
                  '    # Fonksiyonun gövdesi',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Parametreler',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Fonksiyonlara parametreler geçirebilirsiniz. Bu parametreler, fonksiyon içinde kullanılmak üzere işlemler yapılmasını sağlar.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Dönüş Değeri',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Bir fonksiyon isteğe bağlı olarak bir değer döndürebilir. "return" ifadesi ile belirtilen değer, fonksiyonun çağrıldığı yere geri döner.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Lambda (Anonim) Fonksiyonlar',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Lambda fonksiyonları, adı olmayan ve tek bir ifade içeren küçük fonksiyonlardır. Lambda ifadesi "lambda" anahtar kelimesi ile başlar.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                const Text(
                  'lambda parametreler: ifade',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Örnekler',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'İşte birkaç örnek fonksiyon:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'def toplama(a, b):\n'
                    '    return a + b\n\n'
                    'def kare_al(sayı):\n'
                    '    return sayı * sayı\n\n'
                    'def selamla(isim):\n'
                    '    return "Merhaba, " + isim\n\n'
                    'lambda_fonksiyon = lambda x, y: x + y',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Fonksiyon Çağrısı',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Fonksiyonları çağırmak için fonksiyon adını ve gerekli parametreleri kullanın. Dönüş değeri varsa, bu değeri bir değişkene atayabilirsiniz.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Örnek Çağrılar:',
                  style:                  TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'sonuc = toplama(5, 3)\n'
                    'print(sonuc)  # 8\n\n'
                    'print(kare_al(4))  # 16\n\n'
                    'print(selamla("Ahmet"))  # Merhaba, Ahmet\n\n'
                    'print(lambda_fonksiyon(2, 3))  # 5',
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

