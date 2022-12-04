import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_pdf/model/pdf_data.dart';
import 'package:simple_pdf/ui/controllers.dart';
import 'package:simple_pdf/ui/reuse_widgets.dart';

class ProjectDetails extends StatefulWidget {
  const ProjectDetails({super.key});

  @override
  State<ProjectDetails> createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  final List<List<Widget>> projectsWidgets = [];
  late List<Widget> projectsDetails;

  final _storeController = Get.find<Controllers>();

  @override
  void initState() {
    super.initState();
    projectsDetails = [
      ReuseWidgets.input_fields(
          _storeController.projNameController,
          "Project Name",
          "Enter project name here",
          TextInputAction.next,
          Icons.title),
      ReuseWidgets.input_fields(
          _storeController.projDescriptionController,
          "Description",
          "Enter project dscription",
          TextInputAction.next,
          Icons.description)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      maintainState: true,
      title: const Text(
        "Projects",
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
      subtitle: const Text("Enter your projects details"),
      children: [
        OutlinedButton(
            onPressed: () {
              setState(() {
                _addProjects();
              });
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.indigoAccent),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)))),
            child: const Text(
              "Add New Projects +",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 15),
            )),
        _displayProjectsWidgets(),
        projectsWidgets.isEmpty
            ? const SizedBox(
                height: 1,
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        setState(() {
                          _removeProjects();
                        });
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.indigoAccent),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)))),
                      child: const Text(
                        "Remove Project Details -",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15),
                      )),
                  IconButton(
                      alignment: Alignment.center,
                      enableFeedback: true,
                      color: Colors.indigoAccent,
                      iconSize: 30,
                      onPressed: () {
                        _saveProjects();
                      },
                      icon: Icon(Icons.save_sharp)),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
      ],
      backgroundColor: Colors.white,
      collapsedBackgroundColor: const Color.fromARGB(255, 58, 58, 247),
    );
  }

  _addProjects() {
    setState(() {
      projectsWidgets.add(projectsDetails);
      /*PdfData.projects.add(Project(
          projName: _storeController.projNameController.text,
          projDescription: _storeController.projDescriptionController.text));*/
    });
  }

  _removeProjects() {
    setState(() {
      projectsWidgets.removeLast();
      PdfData.projects.removeLast();
    });
  }

  _displayProjectsWidgets() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: projectsWidgets.length,
        itemBuilder: (context, index) {
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: projectsWidgets[index].length,
              itemBuilder: (context, i) {
                return projectsWidgets[index][i];
              });
        });
  }

  _saveProjects() {
    for (int i = 0; i < projectsWidgets.length; i++) {
      PdfData.projects.add(Project(
          projName: _storeController.projNameController.text,
          projDescription: _storeController.projDescriptionController.text));
      print(_storeController.projNameController.text);
    }
  }
}
