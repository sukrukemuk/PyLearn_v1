import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pylearn_v1/service/database.dart';
import 'package:random_string/random_string.dart';

class AddQuizz extends StatefulWidget {
  const AddQuizz({super.key});

  @override
  State<AddQuizz> createState() => _AddQuizState();
}

class _AddQuizState extends State<AddQuizz> {
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;
  bool uploading = false;
  final FocusNode _option2Focus = FocusNode();
  final FocusNode _option3Focus = FocusNode();
  final FocusNode _option4Focus = FocusNode();
  final FocusNode _correctFocus = FocusNode();

  void clearImageAndFetchNew() {
    clearImage();
    getImage();
  }

  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    selectedImage = File(image!.path);
    setState(() {});
  }

  void clearImage() {
    setState(() {
      selectedImage = null;
    });
  }

  void resetDropdownValue() {
    setState(() {
      value = null;
    });
  }

  uploadItem() async {
    setState(() {
      uploading = true;
    });

    if (selectedImage == null ||
        option1controller.text.isEmpty ||
        option2controller.text.isEmpty ||
        option3controller.text.isEmpty ||
        option4controller.text.isEmpty ||
        correctcontroller.text.isEmpty ||
        value == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.black,
          content: Text(
            "Lütfen boş bırakılan kısımları doldurun.",
            style: TextStyle(fontSize: 13, color: Colors.red),
          ),
        ),
      );
      setState(() {
        uploading = false;
      });
      return;
    }

    List<String> options = [
      option1controller.text,
      option2controller.text,
      option3controller.text,
      option4controller.text
    ];
    if (!options.contains(correctcontroller.text)) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.black,
          content: Text(
            "Doğru cevap, seçeneklerden biriyle eşleşmelidir.",
            style: TextStyle(fontSize: 13, color: Colors.red),
          ),
        ),
      );
      setState(() {
        uploading = false;
      });
      return;
    }

    String addName = randomAlphaNumeric(10);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child("blohImage").child(addName);
    final UploadTask task = firebaseStorageRef.putFile(selectedImage!);
    var downloadUrl = await (await task).ref.getDownloadURL();
    // ignore: non_constant_identifier_names
    Map<String, dynamic> AddQuiz = {
      "Image": downloadUrl,
      "Option1": option1controller.text,
      "Option2": option2controller.text,
      "Option3": option3controller.text,
      "Option4": option4controller.text,
      "Correct": correctcontroller.text,
    };
    await DatabaseMethods().AddQuizCategory(AddQuiz, value!).then((value) {
      option1controller.clear();
      option2controller.clear();
      option3controller.clear();
      option4controller.clear();
      correctcontroller.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.black,
          content: Text(
            "Quizz ekleme işlemi başarılı.",
            style: TextStyle(fontSize: 13),
          ),
        ),
      );
      resetDropdownValue();
      setState(() {
        selectedImage = null;
        uploading = false;
      });
    });
  }

  String? value;
  final List<String> quizitems = [
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

  TextEditingController option1controller = TextEditingController();
  TextEditingController option2controller = TextEditingController();
  TextEditingController option3controller = TextEditingController();
  TextEditingController option4controller = TextEditingController();
  TextEditingController correctcontroller = TextEditingController();

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
            padding:
                const EdgeInsets.only(left: 62),
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
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 23,
            bottom: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Quiz Ekleme Paneli",
                  style: GoogleFonts.josefinSans(
                    textStyle: Theme.of(context).textTheme.titleSmall,
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              selectedImage == null
                  ? GestureDetector(
                      onTap: () {
                        getImage();
                      },
                      child: Center(
                        child: Material(
                          elevation: 4,
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              border: Border.all(color: Colors.black, width: 2),
                            ),
                            child: const Icon(
                              Icons.camera_alt_sharp,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: Material(
                        elevation: 4,
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: const BoxDecoration(),
                          child: Image.file(
                            selectedImage!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: const Size(150, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: clearImageAndFetchNew,
                  child: Text(
                    "Soruyu Değiştir",
                    style: GoogleFonts.josefinSans(
                      textStyle: Theme.of(context).textTheme.titleSmall,
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "1. Seçenek",
                style: GoogleFonts.josefinSans(
                  textStyle: Theme.of(context).textTheme.titleSmall,
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  style: const TextStyle(color: Colors.blue),
                  controller: option1controller,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_option2Focus);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.blue, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.blue, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.blue, width: 2),
                    ),
                    hintText: "1. Seçeneği giriniz.",
                    hintStyle: GoogleFonts.josefinSans(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "2. Seçenek",
                style: GoogleFonts.josefinSans(
                  textStyle: Theme.of(context).textTheme.titleSmall,
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  style: const TextStyle(color: Colors.blue),
                  controller: option2controller,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_option3Focus);
                  },
                  focusNode: _option2Focus,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.blue, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.blue, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.blue, width: 2),
                    ),
                    hintText: "2. Seçeneği giriniz.",
                    hintStyle: GoogleFonts.josefinSans(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "3. Seçenek",
                style: GoogleFonts.josefinSans(
                  textStyle: Theme.of(context).textTheme.titleSmall,
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  style: const TextStyle(color: Colors.blue),
                  controller: option3controller,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_option4Focus);
                  },
                  focusNode: _option3Focus,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.blue, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.blue, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.blue, width: 2),
                    ),
                    hintText: "3. Seçeneği giriniz.",
                    hintStyle: GoogleFonts.josefinSans(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "4. Seçenek",
                style: GoogleFonts.josefinSans(
                  textStyle: Theme.of(context).textTheme.titleSmall,
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  style: const TextStyle(color: Colors.blue),
                  controller: option4controller,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_correctFocus);
                  },
                  focusNode: _option4Focus,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.blue, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.blue, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.blue, width: 2),
                    ),
                    hintText: "4. Seçeneği giriniz.",
                    hintStyle: GoogleFonts.josefinSans(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Doğru Seçenek",
                style: GoogleFonts.josefinSans(
                  textStyle: Theme.of(context).textTheme.titleSmall,
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  style: const TextStyle(color: Colors.green),
                  controller: correctcontroller,
                  focusNode: _correctFocus,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.blue, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.blue, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.blue, width: 2),
                    ),
                    hintText: "Doğru Seçeneği giriniz.",
                    hintStyle: GoogleFonts.josefinSans(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    items: quizitems
                        .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors
                                      .orange,
                                ),
                              ),
                            ))
                        .toList(),
                    onChanged: ((value) => setState(() {
                          this.value = value;
                        })),
                    dropdownColor: Colors.white,
                    hint: Text(
                      "Quizz kategorisini seçiniz.",
                      style: GoogleFonts.josefinSans(
                        textStyle: Theme.of(context).textTheme.titleSmall,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    iconSize: 36,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    value: value,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  uploadItem();
                },
                child: Center(
                  child: Material(
                    elevation: 5,
                    child: uploading
                        ? Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            width: 150,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                            ),
                            child: const Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            width: 150,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                "Ekle",
                                style: GoogleFonts.josefinSans(
                                  textStyle:
                                      Theme.of(context).textTheme.titleSmall,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
