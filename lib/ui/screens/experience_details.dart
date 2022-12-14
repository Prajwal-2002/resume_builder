import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_pdf/model/pdf_data.dart';
import 'package:simple_pdf/ui/controllers.dart';
import 'package:simple_pdf/ui/reuse_widgets.dart';

class ExperienceDetails extends StatefulWidget {
  const ExperienceDetails({super.key});

  @override
  State<ExperienceDetails> createState() => _ExperienceDetailsState();
}

class _ExperienceDetailsState extends State<ExperienceDetails> {
  final List<List<Widget>> experienceWidgets = [];
  late List<Widget> experienceDetails;

  /*late TextEditingController _yearActiveController;
  late TextEditingController _positionController;
  late TextEditingController _companyController;
  late TextEditingController _descriptionController;*/
  final _storeController = Get.find<Controllers>();

  @override
  void initState() {
    super.initState();
    /*experienceDetails = [
      ReuseWidgets.input_fields(
          _storeController.yearActiveController,
          "Year Active",
          "Enter year active here",
          TextInputAction.next,
          Icons.calendar_month),
      ReuseWidgets.input_fields(_storeController.positionController, "Position",
          "Enter position here", TextInputAction.next, Icons.work),
      ReuseWidgets.input_fields(_storeController.companyController, "Company",
          "Enter company here", TextInputAction.next, Icons.business),
      ReuseWidgets.input_fields(
          _storeController.descriptionController,
          "Description",
          "Enter description here",
          TextInputAction.next,
          Icons.description),
    ];*/
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
      backgroundColor: Colors.white,
      collapsedBackgroundColor: const Color.fromARGB(255, 58, 58, 247),
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
            ? const SizedBox(
                height: 1,
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        setState(() {
                          _removeExperience();
                        });
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.indigoAccent),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)))),
                      child: const Text(
                        "Remove Experience Details -",
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
                        _saveExperiences();
                      },
                      icon: const Icon(Icons.save_sharp)),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 10,
                  ),
                ],
              )
      ],
    );
  }

  _addExperience() {
    setState(() {
      //experienceWidgets.add(experienceDetails);
      _storeController.companyController.add(TextEditingController());
      _storeController.positionController.add(TextEditingController());
      _storeController.descriptionController.add(TextEditingController());
      _storeController.yearActiveController.add(TextEditingController());
      experienceWidgets.add([
        ReuseWidgets.input_fields(
            _storeController.yearActiveController[
                _storeController.yearActiveController.length - 1],
            "Year Active",
            "Enter year active here",
            TextInputAction.next,
            Icons.calendar_month),
        ReuseWidgets.input_fields(
            _storeController.positionController[
                _storeController.positionController.length - 1],
            "Position",
            "Enter position here",
            TextInputAction.next,
            Icons.work),
        ReuseWidgets.input_fields(
            _storeController.companyController[
                _storeController.companyController.length - 1],
            "Company",
            "Enter company here",
            TextInputAction.next,
            Icons.business),
        ReuseWidgets.input_fields(
            _storeController.descriptionController[
                _storeController.descriptionController.length - 1],
            "Description",
            "Enter description here",
            TextInputAction.next,
            Icons.description),
      ]);
      /*PdfData.experience.add(Experience(
          company: _storeController.companyController.text,
          position: _storeController.positionController.text,
          duration: _storeController.yearActiveController.text,
          description: _storeController.descriptionController.text));*/
    });
  }

  _removeExperience() {
    setState(() {
      _storeController.descriptionController.removeLast();
      _storeController.yearActiveController.removeLast();
      _storeController.companyController.removeLast();
      _storeController.positionController.removeLast();
      experienceWidgets.removeLast();
      PdfData.experience.removeLast();
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

  _saveExperiences() {
    for (int i = 0; i < experienceWidgets.length; i++) {
      PdfData.experience.add(Experience(
          company: _storeController.companyController[i].text,
          position: _storeController.positionController[i].text,
          duration: _storeController.yearActiveController[i].text,
          description: _storeController.descriptionController[i].text));
    }
  }
}
