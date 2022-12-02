import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_pdf/model/pdf_data.dart';
import 'package:simple_pdf/ui/controllers.dart';
import 'package:simple_pdf/ui/screens/awards.dart';
import 'package:simple_pdf/ui/screens/education_details.dart';
import 'package:simple_pdf/ui/screens/experience_details.dart';
import 'package:simple_pdf/ui/screens/personal_details.dart';
import 'package:simple_pdf/ui/screens/projects.dart';
import 'package:simple_pdf/ui/screens/save_pdf2.dart';
import 'package:simple_pdf/ui/screens/skills.dart';

class InputDetails extends StatefulWidget {
  const InputDetails({super.key});

  @override
  State<InputDetails> createState() => _InputDetailsState();
}

class _InputDetailsState extends State<InputDetails> {
  final controller = Get.find<Controllers>();

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
          saveToPdf();
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
          const ExperienceDetails(),
          const SizedBox(height: 15),
          const ProjectDetails(),
          const SizedBox(
            height: 15,
          ),
          const AwardDetails(),
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

  saveToPdf() async {
    SavePdf2.savePdf(PdfDataModel(
        name: controller.nameController.text,
        phone: controller.phoneController.text,
        email: controller.emailController.text,
        address: controller.adressController.text,
        education: PdfData.education,
        experience: PdfData.experience,
        awards: PdfData.awards,
        projects: PdfData.projects,
        skills: PdfData.skills));
  }
}
