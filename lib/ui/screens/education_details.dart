import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_pdf/model/pdf_data.dart';
import 'package:simple_pdf/ui/controllers.dart';
import 'package:simple_pdf/ui/reuse_widgets.dart';

class EducationDetails extends StatefulWidget {
  const EducationDetails({super.key});

  @override
  State<EducationDetails> createState() => _EducationDetailsState();
}

class _EducationDetailsState extends State<EducationDetails> {
  final List<List<Widget>> educationWidgets = [];
  final List<Education> education = [];
  late List<Widget> educationDetails;

  final _storeController = Get.find<Controllers>();

  @override
  void initState() {
    super.initState();
    educationDetails = [
      ReuseWidgets.input_fields(_storeController.courseController, "Course*",
          "Enter course here", TextInputAction.next, Icons.book),
      ReuseWidgets.input_fields(_storeController.schoolController, "School*",
          "Enter school here", TextInputAction.next, Icons.school),
      ReuseWidgets.input_fields(_storeController.cgpaController, "Grade/Score*",
          "Enter CGPA here", TextInputAction.next, Icons.grade),
      ReuseWidgets.input_fields(_storeController.yearController, "Year*",
          "Enter year here", TextInputAction.next, Icons.calendar_month),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
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
      backgroundColor: Colors.white,
      collapsedBackgroundColor: const Color.fromARGB(255, 58, 58, 247),
      children: [
        OutlinedButton(
            onPressed: () {
              setState(() {
                _addEducation();
              });
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.indigoAccent),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)))),
            child: const Text(
              "Add Education Details +",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 15),
            )),
        _displayEducationWidgets(),
        educationWidgets.isEmpty
            ? const SizedBox(
                height: 1,
              )
            : OutlinedButton(
                onPressed: () {
                  setState(() {
                    _removeEducation();
                  });
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.indigoAccent),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)))),
                child: const Text(
                  "Remove Education Details -",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15),
                )),
      ],
    );
  }

  _addEducation() {
    setState(() {
      educationWidgets.add(educationDetails);
      education.add(Education(
        cgpa: _storeController.cgpaController.text,
        course: _storeController.courseController.text,
        school: _storeController.schoolController.text,
        year: 2022,
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
        physics: const NeverScrollableScrollPhysics(),
        itemCount: educationWidgets.length,
        itemBuilder: (context, index) {
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: educationWidgets[index].length,
              itemBuilder: (context, i) {
                return educationWidgets[index][i];
              });
        });
  }
}
