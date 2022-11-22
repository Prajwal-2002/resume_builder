import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_pdf/model/pdf_data.dart';
import 'package:simple_pdf/ui/screens/save_pdf.dart';
import 'package:simple_pdf/ui/screens/save_pdf2.dart';
import '../../input_field.dart';

class InputDetails extends StatefulWidget {
  InputDetails({super.key});

  @override
  State<InputDetails> createState() => _InputDetailsState();
}

class _InputDetailsState extends State<InputDetails> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _adressController = TextEditingController();
  final _emailController = TextEditingController();
  final _cgpaController = TextEditingController();
  final _schoolController = TextEditingController();
  final _courseController = TextEditingController();
  final _yearController = TextEditingController();
  final _yearActiveController = TextEditingController();
  final _positionController = TextEditingController();
  final _companyController = TextEditingController();
  final _descriptionController = TextEditingController();
  final List<Education> education = [];
  @override
  Widget build(BuildContext context) {
    List<Widget> personalDetails = [
      input_fields(_nameController, "Name*", "Enter name here",
          TextInputAction.next, Icons.person),
      input_fields(_phoneController, "Phone*", "Enter phone here",
          TextInputAction.next, Icons.phone),
      input_fields(_emailController, "Email*", "Enter email here",
          TextInputAction.next, Icons.email),
      input_fields(_adressController, "Address*", "Enter address here",
          TextInputAction.next, Icons.location_on),
    ];
    List<Widget> educationDetails = [
      input_fields(_courseController, "Course*", "Enter course here",
          TextInputAction.next, Icons.book),
      input_fields(_schoolController, "School*", "Enter school here",
          TextInputAction.next, Icons.school),
      input_fields(_cgpaController, "Grade/Score*", "Enter CGPA here",
          TextInputAction.next, Icons.grade),
      input_fields(_yearController, "Year*", "Enter year here",
          TextInputAction.next, Icons.calendar_month),
    ];
    List<Widget> experienceDetails = [
      input_fields(_yearActiveController, "Year Active",
          "Enter year active here", TextInputAction.next, Icons.calendar_month),
      input_fields(_positionController, "Position", "Enter position here",
          TextInputAction.next, Icons.work),
      input_fields(_companyController, "Company", "Enter company here",
          TextInputAction.next, Icons.business),
      input_fields(_descriptionController, "Description",
          "Enter description here", TextInputAction.next, Icons.description),
    ];
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
          decoration: BoxDecoration(
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
        margin: EdgeInsets.only(left: 18, right: 18),
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(
              top: 10,
            ),
            child: Text(
              "Sections",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
          _expansionTiles(
              "Personal Details", "Enter Personal Details", personalDetails),
          SizedBox(
            height: 15,
          ),
          _expansionTiles(
              "Education", "Enter Education Details", educationDetails),
          SizedBox(
            height: 15,
          ),
          ExpansionTile(
            title: Text(
              "Skills",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            initiallyExpanded: false,
            collapsedTextColor: Colors.white,
            textColor: Colors.black,
            childrenPadding: EdgeInsets.only(
              top: 10,
            ),
            expandedAlignment: Alignment.center,
            iconColor: Colors.black87,
            subtitle: Text("Enter your skills"),
            children: [
              OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.indigoAccent),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)))),
                  child: Text(
                    "Add Skills +",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15),
                  )),
            ],
            backgroundColor: Colors.white,
            collapsedBackgroundColor: Color.fromARGB(255, 58, 58, 247),
          ),
          SizedBox(
            height: 15,
          ),
          _expansionTiles(
              "Experience", "Enter Experience Details", experienceDetails),
          SizedBox(
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
  }

  _expansionTiles(String text, String subtitle, List<Widget> children) {
    return ExpansionTile(
      title: Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      initiallyExpanded: false,
      collapsedTextColor: Colors.white,
      textColor: Colors.black,
      childrenPadding: EdgeInsets.only(
        top: 10,
      ),
      expandedAlignment: Alignment.center,
      iconColor: Colors.black87,
      subtitle: Text(subtitle),
      children: children,
      backgroundColor: Colors.white,
      collapsedBackgroundColor: Color.fromARGB(255, 58, 58, 247),
    );
  }

  input_fields(TextEditingController ctr, String title, String hint,
      TextInputAction tia, IconData icon) {
    return MyInputField(title: title, hint: hint, tia: tia, icon: Icon(icon));
  }
}
