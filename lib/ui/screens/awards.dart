import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_pdf/model/pdf_data.dart';
import 'package:simple_pdf/ui/controllers.dart';
import 'package:simple_pdf/ui/reuse_widgets.dart';

class AwardDetails extends StatefulWidget {
  const AwardDetails({super.key});

  @override
  State<AwardDetails> createState() => _AwardDetailsState();
}

class _AwardDetailsState extends State<AwardDetails> {
  final List<List<Widget>> awardsWidgets = [];
  late List<Widget> awardsDetails;

  final _storeController = Get.find<Controllers>();

  @override
  void initState() {
    super.initState();
    /*awardsDetails = [
      ReuseWidgets.input_fields(_storeController.titleController, "Award title",
          "Enter award title here", TextInputAction.next, Icons.title),
      ReuseWidgets.input_fields(_storeController.descController, "Description",
          "Enter award dscription", TextInputAction.next, Icons.description)
    ];*/
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      maintainState: true,
      title: const Text(
        "Awards",
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
      subtitle: const Text("Enter your Awards details"),
      backgroundColor: Colors.white,
      collapsedBackgroundColor: const Color.fromARGB(255, 58, 58, 247),
      children: [
        OutlinedButton(
            onPressed: () {
              setState(() {
                _addAwards();
              });
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.indigoAccent),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)))),
            child: const Text(
              "Add New Awards +",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 15),
            )),
        _displayAwardsWidgets(),
        awardsWidgets.isEmpty
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
                          _removeAwards();
                        });
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.indigoAccent),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)))),
                      child: const Text(
                        "Remove Award Details -",
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
                        _saveAwards();
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

  _addAwards() {
    setState(() {
      _storeController.titleController.add(TextEditingController());
      _storeController.descController.add(TextEditingController());
      awardsWidgets.add([
        ReuseWidgets.input_fields(
            _storeController
                .titleController[_storeController.titleController.length - 1],
            "Award title",
            "Enter award title here",
            TextInputAction.next,
            Icons.title),
        ReuseWidgets.input_fields(
            _storeController
                .descController[_storeController.descController.length - 1],
            "Description",
            "Enter award dscription",
            TextInputAction.next,
            Icons.description)
      ]);
    });
  }

  _removeAwards() {
    setState(() {
      _storeController.titleController.removeLast();
      _storeController.descController.removeLast();
      awardsWidgets.removeLast();
      PdfData.awards.removeLast();
    });
  }

  _displayAwardsWidgets() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: awardsWidgets.length,
        itemBuilder: (context, index) {
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: awardsWidgets[index].length,
              itemBuilder: (context, i) {
                return awardsWidgets[index][i];
              });
        });
  }

  _saveAwards() {
      for (int i = 0; i < awardsWidgets.length; i++) {
        PdfData.awards.add(Award(
            title: _storeController.titleController[i].text,
            desc: _storeController.descController[i].text));
    }
  }
}
