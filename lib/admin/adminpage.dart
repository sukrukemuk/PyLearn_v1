import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pylearn_v1/admin/quizzadd.dart';
import 'package:pylearn_v1/admin/quizzdelete.dart';
import 'package:pylearn_v1/admin/userpanel.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 15),
                    buildCard(
                      context,
                      'Quiz Ekleme Paneli',
                      '2.png',
                      const AddQuizz(),
                    ),
                    const SizedBox(height: 15),
                    buildCard(
                      context,
                      'Quiz Silme Paneli',
                      '3.png',
                      const QuizzDelete(),
                    ),
                    const SizedBox(height: 15),
                    buildCard(
                      context,
                      'Kullanıcı Paneli',
                      '1.png',
                      const UsersPanel(),
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

  Widget buildCard(BuildContext context, String title, String imagePath,
      Widget destination) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Card(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: const BorderSide(color: Colors.blue, width: 3),
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/images/$imagePath',
              width: 330,
              height: 170,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                title,
                style: GoogleFonts.josefinSans(
                  textStyle: Theme.of(context).textTheme.titleSmall,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
