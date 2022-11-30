import 'package:flutter/material.dart';
import 'package:simple_pdf/ui/reuse_widgets.dart';

class ExperienceDetails extends StatefulWidget {
  const ExperienceDetails({super.key});

  @override
  State<ExperienceDetails> createState() => _ExperienceDetailsState();
}

class _ExperienceDetailsState extends State<ExperienceDetails> {
  final List<List<Widget>> experienceWidgets = [];
  late List<Widget> experienceDetails;

  late TextEditingController _yearActiveController;
  late TextEditingController _positionController;
  late TextEditingController _companyController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _yearActiveController = TextEditingController();
    _positionController = TextEditingController();
    _companyController = TextEditingController();
    _descriptionController = TextEditingController();
    experienceDetails = [
      ReuseWidgets.input_fields(_yearActiveController, "Year Active",
          "Enter year active here", TextInputAction.next, Icons.calendar_month),
      ReuseWidgets.input_fields(_positionController, "Position",
          "Enter position here", TextInputAction.next, Icons.work),
      ReuseWidgets.input_fields(_companyController, "Company",
          "Enter company here", TextInputAction.next, Icons.business),
      ReuseWidgets.input_fields(_descriptionController, "Description",
          "Enter description here", TextInputAction.next, Icons.description),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      maintainState: true,
      title: const Text(
        "Experience",
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
      subtitle: const Text("Enter your experience details"),
      children: [
        OutlinedButton(
            onPressed: () {
              setState(() {
                _addExperience();
              });
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.indigoAccent),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)))),
            child: const Text(
              "Add Experience Details +",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 15),
            )),
        _displayExperienceWidgets(),
        experienceWidgets.isEmpty
            ? SizedBox(
                height: 1,
              )
            : OutlinedButton(
                onPressed: () {
                  setState(() {
                    _removeExperience();
                  });
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.indigoAccent),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)))),
                child: const Text(
                  "Remove Experience Details +",
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

  _addExperience() {
    setState(() {
      experienceWidgets.add(experienceDetails);
    });
  }

  _removeExperience() {
    setState(() {
      experienceWidgets.removeLast();
    });
  }

  _displayExperienceWidgets() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: experienceWidgets.length,
        itemBuilder: (context, index) {
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: experienceWidgets[index].length,
              itemBuilder: (context, i) {
                return experienceWidgets[index][i];
              });
        });
  }
}
