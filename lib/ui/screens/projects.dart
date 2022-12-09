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
  final _storeController = Get.find<Controllers>();

  @override
  void initState() {
    super.initState();
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
      backgroundColor: Colors.white,
      collapsedBackgroundColor: const Color.fromARGB(255, 58, 58, 247),
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
                      icon: const Icon(Icons.save_sharp)),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
      ],
    );
  }

  _addProjects() {
    setState(() {
      _storeController.projNameController.add(TextEditingController());
      _storeController.projDescriptionController.add(TextEditingController());
      projectsWidgets.add([
        ReuseWidgets.input_fields(
            _storeController.projNameController[
                _storeController.projNameController.length - 1],
            "Project Name",
            "Enter project name here",
            TextInputAction.next,
            Icons.title),
        ReuseWidgets.input_fields(
            _storeController.projDescriptionController[
                _storeController.projDescriptionController.length - 1],
            "Description",
            "Enter project dscription",
            TextInputAction.next,
            Icons.description)
      ]);
    });
  }

  _removeProjects() {
    setState(() {
      _storeController.projNameController.removeLast();
      _storeController.projDescriptionController.removeLast();
      projectsWidgets.removeLast();
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
          projName: _storeController.projNameController[i].text,
          projDescription: _storeController.projDescriptionController[i].text));
    }
  }
}
