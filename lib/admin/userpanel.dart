import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class UsersPanel extends StatefulWidget {
  const UsersPanel({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UsersPanelState createState() => _UsersPanelState();
}

class _UsersPanelState extends State<UsersPanel> {
  List<Map<String, dynamic>> users = [];

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  Future<int> getCompletedQuizCount(String userId) async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    Map<String, dynamic>? completedQuizzes =
        (snapshot.data() as Map<String, dynamic>?)?['completed_quizzes'];
    if (completedQuizzes != null) {
      return completedQuizzes.length;
    } else {
      return 0;
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
              padding: const EdgeInsets.only(left: 30, top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Kullanıcı Paneli",
                    style: GoogleFonts.josefinSans(
                      textStyle: Theme.of(context).textTheme.titleSmall,
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.refresh,
                      color: Colors.blue,
                    ),
                    onPressed: getUsers,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return FutureBuilder<int>(
                    future: getCompletedQuizCount(users[index]['userId']),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        int completedQuizCount = snapshot.data ?? 0;
                        return InkWell(
                          onTap: () {
                            _showUserInfoDialog(users[index]);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 20, left: 5, right: 5),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              dense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              tileColor: Colors.black,
                              leading: users[index]['profilePhoto'] != null
                                  ? CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          users[index]['profilePhoto']),
                                      radius: 20,
                                    )
                                  : const Icon(
                                      Icons.account_circle,
                                      color: Colors.green,
                                      size: 35,
                                    ),
                              textColor: Colors.white,
                              title: Text(
                                users[index]['username'],
                                style:
                                    const TextStyle(fontSize: 20, color: Colors.blue),
                              ),
                              subtitle: Text(users[index]['email']),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Quizz: $completedQuizCount/10',
                                    style: const TextStyle(
                                        color: Colors.green, fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 24,
                                    child: IconButton(
                                      icon: const Icon(Icons.delete),
                                      color: Colors.red,
                                      onPressed: () {
                                        deleteUser(users[index]['userId']);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  dynamic getFieldValue(Map<String, dynamic>? data, String fieldName) {
    return data != null && data.containsKey(fieldName)
        ? data[fieldName]
        : 'Veri yok.';
  }

  Future<void> getUsers() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').get();
    List<Map<String, dynamic>> tempList = [];
    for (QueryDocumentSnapshot doc in snapshot.docs) {
      Map<String, dynamic>? docData =
          doc.data() as Map<String, dynamic>?;
      Map<String, dynamic> userData = {
        'userId': doc.id,
        'username': getFieldValue(docData, 'username'),
        'email': getFieldValue(docData, 'email'),
        'surname': getFieldValue(docData, 'surname'),
        'name': getFieldValue(docData, 'name'),
        'quizz': getFieldValue(docData, 'completed_quizzes'),
        'profilePhoto':
            getFieldValue(docData, 'profilePhoto'),
      };
      tempList.add(userData);
    }
    setState(() {
      users = tempList;
    });
  }

  Future<void> deleteUser(String userId) async {
    await FirebaseFirestore.instance.collection('users').doc(userId).delete();
    getUsers();
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Kullanıcı başarıyla silindi.',
          style: TextStyle(fontSize: 13, color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }

  Future<void> _showUserInfoDialog(Map<String, dynamic> userData) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Center(
          child: AlertDialog(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: const Text(
              'Kullanıcı Bilgileri',
              style: TextStyle(color: Colors.blue),
            ),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Adı: ${userData['name']}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Soyadı: ${userData['surname']}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Kullanıcı Adı: ${userData['username']}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    'E-posta: ${userData['email']}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Quizz: ${userData['quizz']}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Kapat',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
