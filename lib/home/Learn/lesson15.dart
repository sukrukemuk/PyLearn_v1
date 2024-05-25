import 'package:flutter/material.dart';

class Lesson15 extends StatelessWidget {
  const Lesson15({super.key});



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
          'Nesne Tabanlı Programlama',
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
                  'Python Nesne Tabanlı Programlama',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Python\'da nesne tabanlı programlama, programların yapılarını nesneler ve sınıflar aracılığıyla modellemeyi sağlayan bir paradigmadır. Her nesne, özellikleri ve davranışları olan bir varlıktır. Sınıflar, nesnelerin şablonlarını tanımlar.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Sınıf Tanımlama',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Sınıflar, "class" anahtar kelimesi ile tanımlanır ve bir veya daha fazla özellik (attribute) ve metod (method) içerir.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                const Text(
                  'class SinifAdi:',
                  style: TextStyle(fontSize: 16),
                ),
                const Text(
                  '    def __init__(self, parametreler):',
                  style: TextStyle(fontSize: 16),
                ),
                const Text(
                  '        # Yapıcı metod (constructor)',
                  style: TextStyle(fontSize: 16),
                ),
                const Text(
                  '    def metod_adı(self, parametreler):',
                  style: TextStyle(fontSize: 16),
                ),
                const Text(
                  '        # Metodlar',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Özellikler ve Metodlar',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Sınıflar, özellikler (attributes) ve metodlar (methods) içerir. Özellikler, bir nesnenin veri alanlarını temsil ederken, metodlar nesnenin davranışlarını tanımlar.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Nesne Oluşturma',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Sınıflardan nesneler (instances) oluşturmak için sınıf adını ve gerekli parametreleri kullanın. Bu işlem, sınıfın yapıcı metodunu (__init__) çağırarak bir nesne oluşturur.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Örnekler',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'İşte birkaç örnek sınıf:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'class Calisan:\n'
                    '    def __init__(self, isim, maas):\n'
                    '        self.isim = isim\n'
                    '        self.maas = maas\n\n'
                    '    def bilgileri_goster(self):\n'
                    '        print("İsim:", self.isim)\n'
                    '        print("Maaş:", self.maas)\n\n'
                    'class Yonetici(Calisan):\n'
                    '    def __init__(self, isim, maas, departman):\n'
                    '        super().__init__(isim, maas)\n'
                    '        self.departman = departman\n\n'
                    '    def bilgileri_goster(self):\n'
                    '        super().bilgileri_goster()\n'
                    '        print("Departman:", self.departman)',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Nesne Oluşturma ve Kullanma',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Oluşturulan sınıflardan nesneler oluşturarak, bu nesnelerin özelliklerine ve metodlarına erişebiliriz.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Örnek Kullanım:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'calisan1 = Calisan("Ahmet", 5000)\n'
                    'calisan1.bilgileri_goster()\n\n'
                    'yonetici1 = Yonetici("Mehmet", 10000, "İnsan Kaynakları")\n'
                    'yonetici1.bilgileri_goster()',
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

