import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pylearn_v1/auth/controller/auth_controller.dart';
import 'package:pylearn_v1/auth/views/sign_in.dart';
import 'package:pylearn_v1/auth/views/sign_up_info.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FocusNode _passwordFocus = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                      crossAxisAlignment: CrossAxisAlignment
                          .start,
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
                                "Kayıt Ol",
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
                        textInputAction: TextInputAction
                            .next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(
                              _passwordFocus);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Lütfen e-posta adresinizi giriniz.";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "E-posta",
                          labelStyle: const TextStyle(
                              color: Colors
                                  .white),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                color: Colors.blue,
                                width:
                                    2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                color: Colors.blue,
                                width:
                                    2), 
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
                        focusNode:
                            _passwordFocus,

                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Lütfen parolanızı giriniz.";
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Parola",
                          labelStyle: const TextStyle(
                              color: Colors
                                  .white),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                color: Colors.blue,
                                width:
                                    2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                color: Colors.blue,
                                width:
                                    2),
                          ),
                          filled: true,
                          fillColor: Colors.black,
                        ),
                      ),
                    ),
                    Consumer(builder: (context, ref, child) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ref
                                  .read(AuthControllerProvider)
                                  .signUpWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  )
                                  .then(
                                    (value) => Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => SignUpInfo(
                                          email: _emailController.text,
                                        ),
                                      ),
                                      (route) => false,
                                    ),
                                  )
                                  .catchError((error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Lütfen geçerli bir mail adresi ve en az 6 haneli bir parola giriniz.",
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
                            side: const BorderSide(color: Colors.black, width: 3),
                          ),
                          color: Colors.white,
                          minWidth: 400,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 15,
                            ),
                            child: Text(
                              "Devam Et",
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
                      padding: EdgeInsets.symmetric(vertical: 0),
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
                    const Padding(
                      padding:
                          EdgeInsets.only(left: 15, bottom: 7, top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Zaten hesabın var mı?",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    decorationColor: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(),
                      child: Column(
                        children: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => const SignIn()),
                              );
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: const BorderSide(color: Colors.black, width: 3),
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
