import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizzDelete extends StatefulWidget {
  const QuizzDelete({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizzDeleteState createState() => _QuizzDeleteState();
}

class _QuizzDeleteState extends State<QuizzDelete> {
  String? selectedCategory;
  List<String> documentNames = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.black],
            ),
          ),
        ),
        title: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 62),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  "assets/icons/logo.svg",
                  width: 45,
                  height: 45,
                ),
              ],
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage("assets/images/signup.png"),
          ),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Quiz Silme Paneli",
                style: GoogleFonts.josefinSans(
                  textStyle: Theme.of(context).textTheme.titleSmall,
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5, right: 120, left: 10),
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: DropdownButton<String>(
                          value: selectedCategory,
                          hint: Text(
                            "Kategori Seç",
                            style: GoogleFonts.josefinSans(
                              textStyle: Theme.of(context).textTheme.titleSmall,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                          icon: const Icon(Icons.arrow_drop_down,
                              color: Colors.white),
                          iconSize: 25,
                          dropdownColor: Colors.black,
                          underline: const SizedBox(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCategory = newValue;
                              if (selectedCategory != null) {
                                getCategoryDocuments(selectedCategory!);
                              }
                            });
                          },
                          items: <String>[
                            "temelseviye1",
                            "temelseviye2",
                            "kolayseviye1",
                            "kolayseviye2",
                            "ortaseviye1",
                            "ortaseviye2",
                            "zorseviye1",
                            "zorseviye2",
                            "genel1",
                            "genel2",
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 55,
                  width: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      selectedCategory = null;
                      getAllDocuments();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      side: const BorderSide(color: Colors.black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Icon(Icons.list, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: documentNames.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      onTap: () async {
                        Map<String, String> docInfo =
                            _parseDocumentName(documentNames[index]);
                        String category = docInfo['category']!;
                        String docId = docInfo['docId']!;

                        DocumentSnapshot snapshot = await FirebaseFirestore
                            .instance
                            .collection(category)
                            .doc(docId)
                            .get();

                        // ignore: avoid_print
                        print(snapshot.data());

                        Map<String, dynamic>? data =
                            snapshot.data() as Map<String, dynamic>?;

                        showDialog(
                          // ignore: use_build_context_synchronously
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              title: const Center(
                                child: Text(
                                  'Quizz Detayları',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                              content: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom:
                                          10), // Adjust bottom padding as needed
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    child: Column(
                                      children: [
                                        data != null && data['Image'] != null
                                            ? CircleAvatar(
                                                backgroundImage:
                                                    NetworkImage(data['Image']),
                                                radius: 40,
                                              )
                                            : const Icon(
                                                Icons.image,
                                                color: Colors.blue,
                                                size: 40,
                                              ),
                                        const SizedBox(height: 10),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Kategori: $category',
                                                    style: const TextStyle(
                                                        color: Colors.orange)),
                                                if (data != null)
                                                  Text(
                                                      '1. Seçenek: ${data['Option1'] ?? ''}',
                                                      style: const TextStyle(
                                                          color: Colors.white)),
                                                if (data != null)
                                                  Text(
                                                      '2. Seçenek: ${data['Option2'] ?? ''}',
                                                      style: const TextStyle(
                                                          color: Colors.white)),
                                                if (data != null)
                                                  Text(
                                                      '3. Seçenek: ${data['Option3'] ?? ''}',
                                                      style: const TextStyle(
                                                          color: Colors.white)),
                                                if (data != null)
                                                  Text(
                                                      '4. Seçenek: ${data['Option4'] ?? ''}',
                                                      style: const TextStyle(
                                                          color: Colors.white)),
                                                if (data != null)
                                                  Text(
                                                      'Doğru seçenek: ${data['Correct'] ?? ''}',
                                                      style: const TextStyle(
                                                          color: Colors.green)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Kapat'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      textColor: Colors.blue,
                      title: Row(
                        children: [
                          Text(
                            documentNames[index],
                            style: const TextStyle(
                                fontSize: 11, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: () {
                          Map<String, String> docInfo =
                              _parseDocumentName(documentNames[index]);
                          String category = docInfo['category']!;
                          String docId = docInfo['docId']!;
                          deleteDocument(category, docId);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getAllDocuments() async {
    List<String> tempList = [];
    List<String> categories = [
      "temelseviye1",
      "temelseviye2",
      "kolayseviye1",
      "kolayseviye2",
      "ortaseviye1",
      "ortaseviye2",
      "zorseviye1",
      "zorseviye2",
      "genel1",
      "genel2",
    ];
    for (String category in categories) {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection(category).get();
      for (QueryDocumentSnapshot doc in snapshot.docs) {
        String documentWithCategory = '$category - ${doc.id}';
        tempList.add(documentWithCategory);
      }
    }
    setState(() {
      documentNames = tempList;
    });
  }

  Future<void> getCategoryDocuments(String category) async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection(category).get();

    List<String> tempList = [];
    for (QueryDocumentSnapshot doc in snapshot.docs) {
      String documentWithCategory = '$category - ${doc.id}';
      tempList.add(documentWithCategory);
    }
    setState(() {
      documentNames = tempList;
    });
  }

  Future<void> deleteDocument(String category, String docId) async {
    try {
      await FirebaseFirestore.instance.collection(category).doc(docId).delete();
      setState(() {
        documentNames.remove('$category - $docId');
      });
      // ignore: avoid_print
      print('Doküman başarıyla silindi.');
    } catch (e) {
      // ignore: avoid_print
      print('Doküman silinirken bir hata oluştu: $e');
    }
  }

  Map<String, String> _parseDocumentName(String documentName) {
    List<String> parts = documentName.split(' - ');
    return {
      'category': parts[0],
      'docId': parts[1],
    };
  }
}
