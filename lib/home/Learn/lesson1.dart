import 'package:flutter/material.dart';

class Lesson1 extends StatelessWidget {
  const Lesson1({super.key});

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
          'Nesne Yönelimli Programlama',
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
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nesne Yönelimli Programlama (OOP) Nedir?',
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Nesne yönelimli programlama (OOP), programlamada bir paradigma veya yaklaşımdır. OOP, programlama problemlerini çözmek için nesnelerin (objelerin) kullanımına dayanır. Her nesne, veri ve bu veri üzerinde işlem yapabilen işlevleri içeren bir yapıdır. OOP, genellikle dört ana prensip üzerine kuruludur: sınıflar ve nesneler, kapsülleme, kalıtım ve çok biçimlilik.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  'OOP\'nin Temel Prensipleri:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  '1. Sınıflar ve Nesneler\n'
                  '2. Kapsülleme: Nesne içindeki verilerin ve metodların sınırlarının belirlenmesi.\n'
                  '3. Kalıtım\n'
                  '4. Çok Biçimlilik',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  'Kapsülleme Nedir?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Kapsülleme, bir nesnenin iç durumunun (verilerin) ve davranışlarının (metodların) bir araya getirilmesidir. Bu durum ve davranışlar, nesnenin dış dünyayla olan etkileşimini kontrol eden bir arayüz sağlar. Örneğin, bir Araba sınıfı düşünelim. Arabanın hızı, yakıt seviyesi gibi veriler sınıfın içinde tutulabilir ve araba sınıfı dışındaki kodların doğrudan bu verilere erişmesi engellenebilir. Bu, veri gizleme olarak da adlandırılır ve nesne yönelimli programlamanın temel prensiplerinden biridir.',
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
