import 'package:flutter/material.dart';
import 'package:simple_pdf/model/pdf_data.dart';
import 'package:simple_pdf/ui/screens/save_pdf.dart';
import 'package:simple_pdf/ui/screens/input_details.dart';

class CreatePdf extends StatefulWidget {
  const CreatePdf({super.key});

  @override
  State<CreatePdf> createState() => _CreatePdfState();
}

class _CreatePdfState extends State<CreatePdf> {
  final _nameController = TextEditingController();
  final _collegeController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _adressController = TextEditingController();
  final List<Education> education = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(centerTitle: true, title: const Text("Create PDF")),
        body: Container(
          //padding: const EdgeInsets.only(left: 20, right: 20),
          child: const InputDetails(),
          /*SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Enter Details",
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold))),
              //Image.asset('assets/profile.jpg'),
              const SizedBox(
                height: 15,
              ),
              MyInputField(
                  title: 'Name*',
                  icon: const Icon(Icons.person),
                  hint: 'Enter name here.',
                  ctr: _nameController,
                  tia: TextInputAction.next),
              MyInputField(
                  title: 'LinkedIn URL*',
                  icon: const Icon(Icons.link),
                  hint: 'Paste your url here.',
                  ctr: _urlController,
                  tia: TextInputAction.next),
              MyInputField(
                  title: 'College*',
                  icon: const Icon(Icons.school),
                  hint: 'Enter college here.',
                  ctr: _collegeController,
                  tia: TextInputAction.next),
              MyInputField(
                  title: 'Email*',
                  icon: const Icon(Icons.email),
                  hint: 'Enter email here.',
                  ctr: _emailController,
                  tia: TextInputAction.next),
              MyInputField(
                  title: 'Phone*',
                  icon: const Icon(Icons.phone),
                  hint: 'Enter phone here.',
                  ctr: _phoneController,
                  tia: TextInputAction.next),
              MyInputField(
                  title: 'Address*',
                  icon: const Icon(Icons.location_on),
                  hint: 'Enter adress here.',
                  ctr: _adressController,
                  tia: TextInputAction.next),
              MyInputField(
                  title: 'CGPA*',
                  icon: const Icon(Icons.grade),
                  hint: 'Enter cgpa here.',
                  ctr: _cgpaController,
                  tia: TextInputAction.next),
              MyInputField(
                  title: 'DOB*',
                  icon: const Icon(Icons.date_range),
                  hint: 'Enter dob here.',
                  ctr: _dobController,
                  tia: TextInputAction.next),
            ]),
          ),*/
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (() {
            saveToPdf();
          }),
          child: const Icon(Icons.save),
        ));
  }

  saveToPdf() async {
    SavePdf.savePdf(
        PdfData(
          name: _nameController.text,
          college: _collegeController.text,
          email: _emailController.text,
          phone: _phoneController.text,
          address: _adressController.text,
          education: education,
        ),
        context);
  }
}
