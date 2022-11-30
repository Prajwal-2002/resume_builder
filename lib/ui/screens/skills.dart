import 'package:flutter/material.dart';
import 'package:simple_pdf/ui/reuse_widgets.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  final skillsWidgets = [];
  final List<String> _skills = [];
  final educationWidgets = [];

  late TextEditingController _skillController;

  @override
  void initState() {
    super.initState();
    _skillController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
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
                backgroundColor: MaterialStateProperty.all(Colors.indigoAccent),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)))),
            child: const Text(
              "Add Skills +",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 15),
            )),
        skillsWidgets.isEmpty
            ? const SizedBox(
                height: 1,
              )
            : Column(
                children: [
                  ...skillsWidgets,
                  const SizedBox(
                    height: 15,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        setState(() {
                          _removeSkills();
                        });
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.indigoAccent),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)))),
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
    );
  }

  _addSkills() {
    setState(() {
      skillsWidgets.add(ReuseWidgets.input_fields(
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

  /*_displaySkillsWidgets() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: skillsWidgets.length,
        itemBuilder: (context, index) {
          return skillsWidgets[index];
        });
  }*/
}
