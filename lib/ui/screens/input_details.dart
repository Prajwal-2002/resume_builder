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
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _adressController;
  late TextEditingController _emailController;
  late TextEditingController _cgpaController;
  late TextEditingController _schoolController;
  late TextEditingController _courseController;
  late TextEditingController _yearController;
  late TextEditingController _yearActiveController;
  late TextEditingController _positionController;
  late TextEditingController _companyController;
  late TextEditingController _descriptionController;
  late TextEditingController _skillController;
  final skillsWidgets = [];
  final List<String> _skills = [];
  final educationWidgets = [];
  final List<Education> education = [];
  late List<Widget> educationDetails;

  @override
  void initState() {
    super.initState();
    _adressController = TextEditingController();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _cgpaController = TextEditingController();
    _schoolController = TextEditingController();
    _courseController = TextEditingController();
    _yearController = TextEditingController();
    _yearActiveController = TextEditingController();
    _positionController = TextEditingController();
    _companyController = TextEditingController();
    _descriptionController = TextEditingController();
    _skillController = TextEditingController();
    educationDetails = [
      input_fields(_courseController, "Course*", "Enter course here",
          TextInputAction.next, Icons.book),
      input_fields(_schoolController, "School*", "Enter school here",
          TextInputAction.next, Icons.school),
      input_fields(_cgpaController, "Grade/Score*", "Enter CGPA here",
          TextInputAction.next, Icons.grade),
      input_fields(_yearController, "Year*", "Enter year here",
          TextInputAction.next, Icons.calendar_month),
    ];
  }

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
          _expansionTiles(
              "Personal Details", "Enter Personal Details", personalDetails),
          const SizedBox(
            height: 15,
          ),
          ExpansionTile(
            maintainState: true,
            title: const Text(
              "Education",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            initiallyExpanded: false,
            collapsedTextColor: Colors.white,
            textColor: Colors.black,
            childrenPadding: const EdgeInsets.only(
              top: 10,
            ),
            expandedAlignment: Alignment.center,
            iconColor: Colors.black87,
            subtitle: const Text("Enter your education details"),
            children: [
              OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _addEducation();
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.indigoAccent),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)))),
                  child: const Text(
                    "Add Education Details +",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15),
                  )),
              educationWidgets.length == 0
                  ? SizedBox(
                      height: 1,
                    )
                  : _displayEducationWidgets(),
            ],
            backgroundColor: Colors.white,
            collapsedBackgroundColor: const Color.fromARGB(255, 58, 58, 247),
          ),
          const SizedBox(
            height: 15,
          ),
          ExpansionTile(
            maintainState: true,
            title: const Text(
              "Skills",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            initiallyExpanded: false,
            collapsedTextColor: Colors.white,
            textColor: Colors.black,
            childrenPadding: const EdgeInsets.only(
              top: 10,
            ),
            expandedAlignment: Alignment.center,
            iconColor: Colors.black87,
            subtitle: const Text("Enter your skills"),
            children: [
              OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _addSkills();
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.indigoAccent),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)))),
                  child: const Text(
                    "Add Skills +",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15),
                  )),
              skillsWidgets.length == 0
                  ? SizedBox(
                      height: 1,
                    )
                  : Column(
                      children: [
                        ...skillsWidgets,
                        SizedBox(
                          height: 15,
                        ),
                        OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _removeSkills();
                              });
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.indigoAccent),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)))),
                            child: const Text(
                              "Remove Skills -",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 15),
                            )),
                      ],
                    )
            ],
            backgroundColor: Colors.white,
            collapsedBackgroundColor: const Color.fromARGB(255, 58, 58, 247),
          ),
          const SizedBox(
            height: 15,
          ),
          _expansionTiles(
              "Experience", "Enter Experience Details", experienceDetails),
          const SizedBox(
            height: 30,
          ),
        ]),
      )),
    );
  }

  _addEducation() {
    setState(() {
      educationWidgets.addAll(educationDetails);
      education.add(Education(
        cgpa: _cgpaController.text,
        course: _courseController.text,
        school: _schoolController.text,
        year: int.parse(_yearController.text),
      ));
    });
  }

  _removeEducation() {
    setState(() {
      educationWidgets.removeLast();
      education.removeLast();
    });
  }

  _displayEducationWidgets() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: educationWidgets.length,
        itemBuilder: (context, index) {
          return educationWidgets[index];
        });
  }

  _addSkills() {
    setState(() {
      skillsWidgets.add(input_fields(
          _skillController,
          "Skill",
          "Enter skill " + (skillsWidgets.length + 1).toString(),
          TextInputAction.next,
          Icons.workspace_premium));

      _skills.add(_skillController.text);
    });
  }

  _removeSkills() {
    setState(() {
      skillsWidgets.removeLast();
      _skills.removeLast();
    });
  }

  _displaySkillsWidgets() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: skillsWidgets.length,
        itemBuilder: (context, index) {
          return skillsWidgets[index];
        });
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
