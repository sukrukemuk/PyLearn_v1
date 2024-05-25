import 'package:flutter/material.dart';

class Lesson5 extends StatelessWidget {
  const Lesson5({super.key});

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
          'Karakter Dizileri: Strings',
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
                  'Karakter Dizileri (Strings)',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Python\'da karakter dizileri (strings), metin verilerini temsil eder ve genellikle metin işlemleri yapmak için kullanılır. Stringler, tek tırnak (\'\') veya çift tırnak ("") ile tanımlanır.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'String Tanımlama',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Python\'da string oluşturmak için tek tırnak veya çift tırnak kullanabilirsiniz:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'single_quote_string = \'Merhaba, Dünya!\'\n'
                    'double_quote_string = "Merhaba, Dünya!"\n'
                    'multi_line_string = """\n'
                    'Bu, çok satırlı\n'
                    'bir string örneğidir.\n'
                    '"""',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'String Birleştirme',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Stringler, + operatörü kullanılarak birleştirilebilir:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'first_name = "John"\n'
                    'last_name = "Doe"\n'
                    'full_name = first_name + " " + last_name\n'
                    'print(full_name)  # John Doe',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'String Çoğaltma',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Stringleri, * operatörü kullanarak çoğaltabilirsiniz:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'repeat_string = "abc"\n'
                    'result = repeat_string * 3\n'
                    'print(result)  # abcabcabc',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'String İndeksleme ve Dilimleme',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Stringlerde belirli bir karaktere erişmek için indeksleme, bir alt string elde etmek için dilimleme kullanabilirsiniz:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'text = "Hello, World!"\n'
                    'print(text[0])  # H\n'
                    'print(text[7:12])  # World\n'
                    'print(text[-1])  # !',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'String Metotları',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Python, stringlerle çalışmak için birçok yerleşik metot sağlar. İşte bazı yaygın kullanılan string metotları:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'text = " hello, world! "\n\n'
                    '# strip() - Başı ve sonundaki boşlukları kaldırır\n'
                    'print(text.strip())  # "hello, world!"\n\n'
                    '# upper() - Tüm karakterleri büyük harfe çevirir\n'
                    'print(text.upper())  # " HELLO, WORLD! "\n\n'
                    '# lower() - Tüm karakterleri küçük harfe çevirir\n'
                    'print(text.lower())  # " hello, world! "\n\n'
                    '# replace() - Belirli bir alt stringi değiştirir\n'
                    'print(text.replace("world", "Python"))  # " hello, Python! "\n\n'
                    '# split() - Stringi belirli bir ayırıcıya göre böler\n'
                    'print(text.split(","))  # [" hello", " world! "]',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Formatlama',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Python\'da stringleri formatlamak için çeşitli yöntemler vardır. En yaygın yöntemlerden biri, f-stringlerdir:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'name = "Alice"\n'
                    'age = 30\n'
                    'greeting = f"Merhaba, benim adım {name} ve ben {age} yaşındayım."\n'
                    'print(greeting)  # Merhaba, benim adım Alice ve ben 30 yaşındayım.',
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
