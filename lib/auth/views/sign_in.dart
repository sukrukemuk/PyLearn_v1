import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pylearn_v1/admin/admin_login.dart';
import 'package:pylearn_v1/auth/repository/auth_repository.dart';
import 'package:pylearn_v1/auth/views/resetpassword.dart';
import 'package:pylearn_v1/home/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'sign_up.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();

  static void checkUserFromDevice(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final String? eposta = prefs.getString("eposta");
    final String? password = prefs.getString("password");
    if (eposta != null && password != null) {
      Navigator.pushAndRemoveUntil(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
        (route) => false,
      );
    }
  }
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FocusNode _passwordFocus = FocusNode();

  @override
  void initState() {
    SignIn.checkUserFromDevice(context);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _saveUserToDevice() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('eposta', _emailController.text);
    prefs.setString('password', _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.23,
              padding: const EdgeInsets.all(18),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 5, bottom: 9),
                                child: SvgPicture.asset(
                                  "assets/icons/splash.svg",
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              Text(
                                "Merhaba!",
                                style: GoogleFonts.josefinSans(
                                  textStyle:
                                      Theme.of(context).textTheme.titleSmall,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: TextFormField(
                        cursorColor: Colors.white,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                        controller: _emailController,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_passwordFocus);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Lütfen e-posta adresinizi giriniz.";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "E-posta",
                          labelStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2),
                          ),
                          filled: true,
                          fillColor: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: TextFormField(
                        cursorColor: Colors.white,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                        controller: _passwordController,
                        focusNode: _passwordFocus,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Lütfen parolanızı giriniz.";
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Parola",
                          labelStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2),
                          ),
                          filled: true,
                          fillColor: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const PasswordResetPage(),
                                ),
                              );
                            },
                            child: const Row(
                              children: [
                                Text(
                                  "Şifreni mi unuttun?",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Consumer(builder: (context, ref, child) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2,
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            _saveUserToDevice();
                            if (_formKey.currentState!.validate()) {
                              ref
                                  .read(authRepositoryProvider)
                                  .signInWithEmailAndPassword(
                                      email: _emailController.text,
                                      password: _passwordController.text)
                                  .then((value) {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const HomePage()),
                                  (route) => false,
                                );
                              }).catchError((error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Lütfen geçerli kullanıcı bilgileri giriniz.",
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.red),
                                    ),
                                    backgroundColor: Colors.black,
                                  ),
                                );
                              });
                            }
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side:
                                const BorderSide(color: Colors.black, width: 3),
                          ),
                          color: Colors.white,
                          minWidth: 400,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 15,
                            ),
                            child: Text(
                              "Giriş Yap",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.blue,
                              thickness: 2,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "veya",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.blue,
                              thickness: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Column(
                        children: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const SignUp()),
                              );
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: const BorderSide(
                                  color: Colors.black, width: 3),
                            ),
                            color: Colors.white,
                            minWidth: 400,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                              child: Text(
                                "Kayıt Ol",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30, left: 5),
                            child: IconButton(
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const AdminLogin(),
                                ),
                              ),
                              icon: const Icon(
                                Icons.admin_panel_settings_sharp,
                                color: Colors.blue,
                                size: 37,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
