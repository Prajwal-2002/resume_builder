import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_pdf/ui/screens/education_details.dart';
import 'package:simple_pdf/ui/screens/experience_details.dart';
import 'package:simple_pdf/ui/screens/personal_details.dart';
import 'package:simple_pdf/ui/screens/skills.dart';
import '../../input_field.dart';

class InputDetails extends StatefulWidget {
  const InputDetails({super.key});

  @override
  State<InputDetails> createState() => _InputDetailsState();
}

class _InputDetailsState extends State<InputDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Input Details',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [Colors.blue, Colors.deepOrangeAccent])),
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getImageFromGallery();
        },
        child: const Icon(Icons.add),
      ),*/
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          //saveToPdf();
        }),
        child: const Icon(Icons.save),
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.only(left: 18, right: 18),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            child: const Text(
              "Sections",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
          PersonalDetails(),
          const SizedBox(
            height: 15,
          ),
          const EducationDetails(),
          const SizedBox(
            height: 15,
          ),
          const Skills(),
          const SizedBox(
            height: 15,
          ),
          ExperienceDetails(),
          const SizedBox(
            height: 30,
          ),
        ]),
      )),
    );
  }

  _getImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery, maxHeight: 1800, maxWidth: 1800);
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
    }
  }

  /*saveToPdf() async {
    SavePdf2.savePdf(
      PdfData(
        name: _nameController.text,
        college: _schoolController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        address: _adressController.text,
        education: education,
      ),
    );
  }*/
  _expansionTiles(String text, String subtitle, List<Widget> children) {
    return ExpansionTile(
      title: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      initiallyExpanded: false,
      collapsedTextColor: Colors.white,
      textColor: Colors.black,
      childrenPadding: const EdgeInsets.only(
        top: 10,
      ),
      expandedAlignment: Alignment.center,
      iconColor: Colors.black87,
      subtitle: Text(subtitle),
      children: children,
      backgroundColor: Colors.white,
      collapsedBackgroundColor: const Color.fromARGB(255, 58, 58, 247),
    );
  }

  input_fields(TextEditingController ctr, String title, String hint,
      TextInputAction tia, IconData icon) {
    return MyInputField(title: title, hint: hint, tia: tia, icon: Icon(icon));
  }
}
