import 'package:flutter/material.dart';
import 'package:simple_pdf/model/pdf_data.dart';
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

  late TextEditingController _cgpaController;
  late TextEditingController _schoolController;
  late TextEditingController _courseController;
  late TextEditingController _yearController;

  @override
  void initState() {
    super.initState();
    _cgpaController = TextEditingController();
    _schoolController = TextEditingController();
    _courseController = TextEditingController();
    _yearController = TextEditingController();
    educationDetails = [
      ReuseWidgets.input_fields(_courseController, "Course*",
          "Enter course here", TextInputAction.next, Icons.book),
      ReuseWidgets.input_fields(_schoolController, "School*",
          "Enter school here", TextInputAction.next, Icons.school),
      ReuseWidgets.input_fields(_cgpaController, "Grade/Score*",
          "Enter CGPA here", TextInputAction.next, Icons.grade),
      ReuseWidgets.input_fields(_yearController, "Year*", "Enter year here",
          TextInputAction.next, Icons.calendar_month),
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
            ? SizedBox(
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
                  "Remove Education Details +",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15),
                )),
      ],
      backgroundColor: Colors.white,
      collapsedBackgroundColor: const Color.fromARGB(255, 58, 58, 247),
    );
  }

  _addEducation() {
    setState(() {
      educationWidgets.add(educationDetails);
      education.add(Education(
        cgpa: _cgpaController.text,
        course: _courseController.text,
        school: _schoolController.text,
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
