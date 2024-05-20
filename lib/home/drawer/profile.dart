import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Map<String, dynamic> userData;
  bool isEditing = false;
  bool isLoading = true;
  late XFile? _imageFile;
  int completedQuizCount = 0;

  @override
  void initState() {
    super.initState();
    _imageFile = null;
    getUserData();
    getCompletedQuizCount();
  }

  Future<void> getUserData() async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      var snapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      setState(() {
        userData = snapshot.data() ?? {};
        isLoading = false;
      });
    } catch (e) {
      // ignore: avoid_print
      print("Kullanıcı verileri alınamadı: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> getCompletedQuizCount() async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot snapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      Map<String, dynamic>? completedQuizzes =
          (snapshot.data() as Map<String, dynamic>?)?['completed_quizzes'];
      // ignore: unnecessary_type_check
      if (completedQuizzes != null) {
        setState(() {
          completedQuizCount = completedQuizzes.length;
        });
      }
    } catch (e) {
      // ignore: avoid_print
      print('Hata: Tamamlanan quiz sayısını alırken bir hata oluştu: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.black
              ],
            ),
          ),
        ),
        title: const Text(
          'Profil',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 30),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    children: <Widget>[
                      SizedBox(
                        height: 160,
                        width: 160,
                        child: GestureDetector(
                          onTap: () async {
                            if (isEditing) {
                              final picker = ImagePicker();
                              final pickedFile = await picker.pickImage(
                                  source: ImageSource.gallery);
                              if (pickedFile != null) {
                                setState(() {
                                  _imageFile = pickedFile;
                                });
                                String uid =
                                    FirebaseAuth.instance.currentUser!.uid;
                                String imageName =
                                    'profile_image_$uid.jpg';
                                firebase_storage.Reference ref =
                                    firebase_storage.FirebaseStorage.instance
                                        .ref()
                                        .child('profile_images')
                                        .child(imageName);
                                await ref.putFile(File(_imageFile!.path));
                                String downloadURL = await ref.getDownloadURL();

                                try {
                                  await FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(uid)
                                      .update({'profilePhoto': downloadURL});
                                  // ignore: use_build_context_synchronously
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text(
                                      'Profil fotoğrafı güncellendi.',
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.white),
                                    ),
                                    backgroundColor: Colors.black,
                                  ));
                                } catch (e) {
                                  // ignore: avoid_print
                                  print("Firestore'da güncelleme hatası: $e");
                                  // ignore: use_build_context_synchronously
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text(
                                      'Profil fotoğrafı güncellenirken bir hata oluştu.',
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.red),
                                    ),
                                    backgroundColor: Colors.black,
                                  ));
                                }
                              }
                            }
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius:
                                60,
                            child: _imageFile != null
                                ? ClipOval(
                                    child: Image.file(
                                      File(_imageFile!.path),
                                      fit: BoxFit.cover,
                                      width: 120,
                                      height: 120,
                                    ),
                                  )
                                : StreamBuilder<DocumentSnapshot>(
                                    stream: FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(FirebaseAuth
                                            .instance.currentUser!.uid)
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return const Icon(
                                          Icons.account_circle,
                                          size: 120,
                                          color: Colors.grey,
                                        );
                                      } else {
                                        var profilePhoto =
                                            snapshot.data!.get('profilePhoto');
                                        if (profilePhoto != null) {
                                          return ClipOval(
                                            child: Image.network(
                                              profilePhoto,
                                              fit: BoxFit.cover,
                                              width:
                                                  130,
                                              height:
                                                  130,
                                            ),
                                          );
                                        } else {
                                          return const Icon(
                                            Icons.account_circle,
                                            size: 120,
                                            color: Colors.grey,
                                          );
                                        }
                                      }
                                    },
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        enabled: isEditing,
                        initialValue: userData['name'],
                        onChanged: (value) {
                          userData['name'] = value;
                        },
                        decoration: const InputDecoration(
                          labelText: 'İsim',
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        enabled: isEditing,
                        initialValue: userData['surname'],
                        onChanged: (value) {
                          userData['surname'] = value;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Soyisim',
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        enabled: isEditing,
                        initialValue: userData['username'],
                        onChanged: (value) {
                          userData['username'] = value;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Kullanıcı Adı',
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        enabled: false,
                        initialValue: userData['email'],
                        onChanged: (value) {
                          userData['email'] = value;
                        },
                        decoration: const InputDecoration(
                          labelText: 'E-posta',
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          if (isEditing) {
                            try {
                              String uid =
                                  FirebaseAuth.instance.currentUser!.uid;
                              await FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(uid)
                                  .update(userData);
                              setState(() {
                                isEditing = false;
                              });
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Değişiklikler başarıyla kaydedildi.',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.white),
                                  ),
                                  backgroundColor: Colors.black,
                                ),
                              );
                            } catch (e) {
                              // ignore: avoid_print
                              print("Hata oluştu: $e");
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Değişiklikler kaydedilirken bir hata oluştu.',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.red),
                                  ),
                                  backgroundColor: Colors.black,
                                ),
                              );
                            }
                          } else {
                            setState(() {
                              isEditing = true;
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10),
                          ),
                          backgroundColor: Colors.black,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 20.0),
                          child: Text(
                            isEditing ? 'Kaydet' : 'Düzenle',
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'İlerlemeniz: ${(completedQuizCount / 10 * 100).toStringAsFixed(0)}%',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Stack(
                        children: [
                          Center(
                            child: SizedBox(
                              width: 300,
                              child: LinearProgressIndicator(
                                value: completedQuizCount / 10,
                                backgroundColor: Colors.grey[300],
                                valueColor:
                                    const AlwaysStoppedAnimation<Color>(Colors.cyan),
                                minHeight: 7,
                                semanticsLabel:
                                    'Loading',
                                semanticsValue:
                                    '${(completedQuizCount / 10 * 100).toStringAsFixed(0)}%',
                                borderRadius: BorderRadius.circular(
                                    20),
                              ),
                            ),
                          ),
                          if (completedQuizCount ==
                              10)
                            const Positioned.fill(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 8),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons
                                        .emoji_events,
                                    color: Colors.orange,
                                    size: 48,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
