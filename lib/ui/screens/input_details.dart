import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_pdf/ui/save_pdf.dart';

class InputDetails extends StatefulWidget {
  InputDetails({super.key});

  @override
  State<InputDetails> createState() => _InputDetailsState();
}

class _InputDetailsState extends State<InputDetails> {
  @override
  Widget build(BuildContext context) {
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
                  colors: [Colors.blue, Colors.red])),
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getImageFromGallery();
        },
        child: const Icon(Icons.add),
      ),*/
      body: SingleChildScrollView(
          child: Column(children: [
        Container(
          margin: EdgeInsets.only(
            top: 10,
            left: 15,
            right: 15,
          ),
          child: Text(
            "Sections",
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
        ExpansionTile(
          title: Text("Personal Details"),
          subtitle: Text("Enter Personal Details"),
          children: [ListTile(title: Text('This is tile number 1'))],
          backgroundColor: Colors.deepOrangeAccent,
          collapsedBackgroundColor: Colors.yellowAccent,
        ),
        fields("Personal Details", Icon(Icons.person)),
        fields("Education", Icon(Icons.school)),
        fields("Experience", Icon(Icons.work)),
        fields("Skills", Icon(Icons.settings)),
        fields("Languages", Icon(Icons.language)),
      ])),
    );
  }

  _getImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery, maxHeight: 1800, maxWidth: 1800);
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
    }
  }

  fields(String field, Icon icon) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
        left: 15,
        right: 15,
      ),
      height: 50,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [Colors.blue, Colors.orangeAccent])),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            height: 25,
            width: 25,
            margin: EdgeInsets.only(
              left: 5,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: icon,
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: 50,
            width: 150,
            margin: EdgeInsets.only(
              left: 15,
            ),
            child: Text(
              field,
              style: TextStyle(fontSize: 17, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
