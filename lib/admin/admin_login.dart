import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pylearn_v1/admin/adminpage.dart';

class MyLogoWidget extends StatelessWidget {
  const MyLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 32, bottom: 14),
      child: SvgPicture.asset(
        'assets/icons/logo.svg',
        width: 140,
        height: 140,
      ),
    );
  }
}

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController adminnamecontroller = TextEditingController();
  TextEditingController adminpasswordcontroller = TextEditingController();
  final FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 239, 239),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 2,
            ),
            padding: const EdgeInsets.only(top: 45, left: 20, right: 20),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/splash.png"),
              ),
              gradient: const LinearGradient(
                  colors: [Color.fromARGB(255, 53, 51, 51), Colors.black],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              borderRadius: BorderRadius.vertical(
                top: Radius.elliptical(MediaQuery.of(context).size.width, 30),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(
                left: 30,
                right: 30,
                top: 110,
              ),
              child: Form(
                child: Column(
                  children: [
                    const MyLogoWidget(),
                    Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2.3,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 63, 153, 199),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 47),
                            Container(
                              padding: const EdgeInsets.only(
                                left: 20,
                                top: 7,
                                bottom: 7,
                              ),
                              margin: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: TextFormField(
                                  style: const TextStyle(color: Colors.white),
                                  cursorColor: Colors.white,
                                  controller: adminnamecontroller,
                                  textInputAction: TextInputAction.next,
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context)
                                        .requestFocus(_passwordFocus);
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Lütfen kullanıcı adınızı giriniz.";
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Kullanıcı Adı",
                                    hintStyle: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Container(
                              padding: const EdgeInsets.only(
                                left: 20,
                                top: 7,
                                bottom: 7,
                              ),
                              margin: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: TextFormField(
                                  style: const TextStyle(color: Colors.white),
                                  cursorColor: Colors.white,
                                  controller: adminpasswordcontroller,
                                  focusNode: _passwordFocus,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Lütfen parola giriniz.";
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Parola",
                                    hintStyle: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            GestureDetector(
                              onTap: () {
                                LoginAdmin();
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Center(
                                  child: Text(
                                    "Giriş Yap",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  LoginAdmin() {
    FirebaseFirestore.instance.collection("admin").get().then((snapshot) {
      bool found = false;
      for (var result in snapshot.docs) {
        if (result.data()["name"] == adminnamecontroller.text.trim() &&
            result.data()["password"] == adminpasswordcontroller.text.trim()) {
          found = true;
        }
      }
      if (found) {
        Route route =
            MaterialPageRoute(builder: (context) => const AdminPage());
        Navigator.pushReplacement(context, route);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Lütfen geçerli kullanıcı bilgileri giriniz.",
              style: TextStyle(fontSize: 13, color: Colors.white),
            ),
            backgroundColor: Colors.black,
          ),
        );
      }
    }).catchError((error) {
      // ignore: avoid_print
      print("Firestore Error: $error");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Firebase erişim hatası.: $error",
            style: const TextStyle(fontSize: 13, color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
      );
    });
  }
}
