import 'package:flutter/material.dart' as material;
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:simple_pdf/model/pdf_data.dart';
import 'dart:io';
import 'package:simple_pdf/ui/pdf_viewer_page.dart';

class SavePdf {
  static void savePdf(PdfData pdfData, context) async {
    final Document pdf = Document();
    final image = MemoryImage(
        (await rootBundle.load('assets/profile.jpg')).buffer.asUint8List());
    //final netImage = await networkImage('https://www.nfet.net/nfet.jpg');
    final img = MemoryImage(
        (await rootBundle.load('assets/background.png')).buffer.asUint8List());
    final user = MemoryImage(
        (await rootBundle.load('assets/icons/user.png')).buffer.asUint8List());
    final education = MemoryImage(
        (await rootBundle.load('assets/icons/college-graduation.png'))
            .buffer
            .asUint8List());
    final skills = MemoryImage(
        (await rootBundle.load('assets/icons/settings.png'))
            .buffer
            .asUint8List());
    final portfolio = MemoryImage(
        (await rootBundle.load('assets/icons/portfolio.png'))
            .buffer
            .asUint8List());
    final phone = MemoryImage(
        (await rootBundle.load('assets/icons/phone.png')).buffer.asUint8List());
    final email = MemoryImage(
        (await rootBundle.load('assets/icons/email.png')).buffer.asUint8List());
    final language = MemoryImage(
        (await rootBundle.load('assets/icons/language.png'))
            .buffer
            .asUint8List());

    pdf.addPage(Page(
        theme: ThemeData.withFont(
          base: await PdfGoogleFonts.varelaRoundRegular(),
          bold: await PdfGoogleFonts.varelaRoundRegular(),
          icons: await PdfGoogleFonts.materialIcons(),
        ),
        pageFormat: PdfPageFormat.a4,
        build: (Context context) {
          return Container(
              color: PdfColors.pink50,
              child: Stack(alignment: Alignment.center, children: [
                Image(img),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    SizedBox(width: 38),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          /*Text("Curriculum Vitae",
                            style: TextStyle(fontSize: 20)),*/
                          SizedBox(height: 50),
                          Container(
                            padding: EdgeInsets.all(10),
                            height: 160,
                            width: 160,
                            decoration: BoxDecoration(
                              color: PdfColor.fromHex('#00bfc3'),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: image,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                        ]),
                    SizedBox(width: 58),
                    Column(children: [
                      SizedBox(height: 75),
                      Container(
                          height: 150,
                          width: 180,
                          decoration: BoxDecoration(
                            color: PdfColor.fromHex('#ffdfdd'),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Prajwal B M"),
                                Text("Flutter Developer"),
                                Text("Contact Me:"),
                                Text("+91123456789"),
                                Text("hello@gmail.com"),
                              ])),
                    ]),
                  ]),
                  Divider(
                      thickness: 2,
                      color: PdfColors.black,
                      indent: 20,
                      endIndent: 20),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                /*Icon(IconData(
                          material.Icons.person_outline.codePoint,
                        )),*/
                                SizedBox(width: 27),
                                Container(
                                  height: 28,
                                  width: 28,
                                  decoration: BoxDecoration(
                                    color: PdfColor.fromHex('#f3e8d0'),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: user,
                                      //fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  padding: const EdgeInsets.all(6),
                                  child: Text("About Me",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  decoration: BoxDecoration(
                                    color: PdfColor.fromHex('#f3e8d0'),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ]),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 45, top: 10, bottom: 10),
                            width: 195,
                            height: 50,
                            child: Text(
                                "Hello! I am Prajwal. I am an experienced Graphic Designer with over 10 years of working experience in the advertising industry. I mainly work on Logo design and web design. ",
                                maxLines: 5,
                                style: const TextStyle(
                                  fontSize: 10,
                                )),
                          ),
                          /*Divider(
                              thickness: 2,
                              color: PdfColors.black,
                              indent: 20,
                              endIndent: 250),*/
                          Container(
                            margin: EdgeInsets.only(
                                left: 20, top: 10, bottom: 10, right: 20),
                            height: 1.7,
                            width: 210,
                            color: PdfColors.black,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                /*Icon(IconData(
                          material.Icons.person_outline.codePoint,
                        )),*/
                                SizedBox(width: 27),
                                Container(
                                  height: 28,
                                  width: 28,
                                  decoration: BoxDecoration(
                                    color: PdfColor.fromHex('#f3e8d0'),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: education,
                                      //fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  padding: EdgeInsets.all(6),
                                  child: Text("Education",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  decoration: BoxDecoration(
                                    color: PdfColor.fromHex('#f3e8d0'),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ]),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 5,
                                  width: 5,
                                  margin: const EdgeInsets.only(
                                      left: 45, top: 10, right: 7),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: PdfColors.black,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 8,
                                  ),
                                  width: 150,
                                  height: 15,
                                  child: Text(
                                      "Bachelor of Engineering in Computer Science and Engineering*",
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 8,
                                        fontBold: Font.timesBoldItalic(),
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ]),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 5,
                                  width: 5,
                                  margin: EdgeInsets.only(
                                      left: 45, top: 10, right: 7),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: PdfColors.black,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 8,
                                  ),
                                  width: 150,
                                  height: 8,
                                  child: Text("Pre-University",
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 8,
                                        fontBold: Font.timesBoldItalic(),
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ]),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 5,
                                  width: 5,
                                  margin: EdgeInsets.only(
                                      left: 45, top: 10, right: 7),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: PdfColors.black,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 8,
                                  ),
                                  width: 150,
                                  height: 10,
                                  child: Text("High School",
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 8,
                                        fontBold: Font.timesBoldItalic(),
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ]),
                          /*Divider(
                            thickness: 2,
                            color: PdfColors.black,
                            indent: 20,
                            endIndent: 20,
                          ),*/
                          Container(
                            margin: EdgeInsets.only(
                                left: 20, top: 10, bottom: 10, right: 20),
                            height: 1.7,
                            width: 210,
                            color: PdfColors.black,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: 27),
                                Container(
                                  height: 28,
                                  width: 28,
                                  decoration: BoxDecoration(
                                    color: PdfColor.fromHex('#f3e8d0'),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: skills,
                                      //fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  padding: EdgeInsets.all(6),
                                  child: Text("Skills",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  decoration: BoxDecoration(
                                    color: PdfColor.fromHex('#f3e8d0'),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ]),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 5,
                                  width: 5,
                                  margin: EdgeInsets.only(
                                      left: 45, top: 12, right: 7),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: PdfColors.black,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 8,
                                  ),
                                  width: 150,
                                  height: 10,
                                  child: Text("Java",
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontBold: Font.helveticaBold(),
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ]),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 5,
                                  width: 5,
                                  margin: EdgeInsets.only(
                                      left: 45, top: 12, right: 7),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: PdfColors.black,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 8,
                                  ),
                                  width: 150,
                                  height: 10,
                                  child: Text("Python",
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontBold: Font.helveticaBold(),
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ]),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 5,
                                  width: 5,
                                  margin: EdgeInsets.only(
                                      left: 45, top: 12, right: 7),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: PdfColors.black,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 8,
                                  ),
                                  width: 150,
                                  height: 10,
                                  child: Text("C Programming",
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontBold: Font.helveticaBold(),
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ]),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 5,
                                  width: 5,
                                  margin: EdgeInsets.only(
                                      left: 45, top: 12, right: 7),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: PdfColors.black,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 8,
                                  ),
                                  width: 150,
                                  height: 10,
                                  child: Text("JavaScript",
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontBold: Font.helveticaBold(),
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ]),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 5,
                                  width: 5,
                                  margin: EdgeInsets.only(
                                      left: 45, top: 12, right: 7),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: PdfColors.black,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 8,
                                  ),
                                  width: 150,
                                  height: 10,
                                  child: Text("SQL",
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontBold: Font.helveticaBold(),
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ]),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 5,
                                  width: 5,
                                  margin: EdgeInsets.only(
                                      left: 45, top: 12, right: 7),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: PdfColors.black,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 8,
                                  ),
                                  width: 150,
                                  height: 10,
                                  child: Text("NodeJS",
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontBold: Font.helveticaBold(),
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ]),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 5,
                                  width: 5,
                                  margin: EdgeInsets.only(
                                      left: 45, top: 12, right: 7),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: PdfColors.black,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 8,
                                  ),
                                  width: 150,
                                  height: 10,
                                  child: Text("IOT",
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontBold: Font.helveticaBold(),
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ]),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 5,
                                  width: 5,
                                  margin: EdgeInsets.only(
                                      left: 45, top: 12, right: 7),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: PdfColors.black,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 8,
                                  ),
                                  width: 150,
                                  height: 10,
                                  child: Text("AI/ML",
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontBold: Font.helveticaBold(),
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ]),
                        ]),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 28,
                                  width: 28,
                                  decoration: BoxDecoration(
                                    color: PdfColor.fromHex('#f3e8d0'),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: portfolio,
                                      //fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  padding: EdgeInsets.all(6),
                                  child: Text("Experience",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  decoration: BoxDecoration(
                                    color: PdfColor.fromHex('#f3e8d0'),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ]),
                          Container(
                            margin: EdgeInsets.only(
                              left: 20,
                              top: 10,
                            ),
                            child: Text("2022-Present",
                                style: TextStyle(
                                    fontSize: 11,
                                    fontBold: Font.courierBold(),
                                    fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 20,
                              top: 3,
                            ),
                            child: Text("HiCampus l Bangalore,Karnataka",
                                style: TextStyle(
                                  fontSize: 8,
                                  fontBold: Font.helveticaBold(),
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 20,
                              top: 2,
                            ),
                            child: Text("Flutter Intern...",
                                style: TextStyle(
                                  fontSize: 9,
                                  fontBold: Font.timesBoldItalic(),
                                )),
                          ),
                          /*Divider(
                              thickness: 2,
                              color: PdfColors.black,
                              indent: 20,
                              endIndent: 250),*/
                          SizedBox(height: 200),
                          Container(
                            margin:
                                EdgeInsets.only(top: 10, bottom: 10, right: 20),
                            height: 1.7,
                            width: 210,
                            color: PdfColors.black,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 28,
                                  width: 28,
                                  decoration: BoxDecoration(
                                    color: PdfColor.fromHex('#f3e8d0'),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: language,
                                      //fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  padding: EdgeInsets.all(6),
                                  child: Text("Languages",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  decoration: BoxDecoration(
                                    color: PdfColor.fromHex('#f3e8d0'),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ]),
                          Container(
                            margin: EdgeInsets.only(
                              left: 20,
                              top: 10,
                            ),
                            width: 200,
                            height: 10,
                            child: Text("English,Hindi,Kannada,Marathi",
                                style: TextStyle(
                                  fontSize: 11.5,
                                  fontBold: Font.helveticaBold(),
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          SizedBox(height: 40),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 20,
                                  ),
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    color: PdfColor.fromHex('#f3e8d0'),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: phone,
                                      //fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text("+917090615615",
                                    style: TextStyle(fontSize: 9)),
                              ]),
                          SizedBox(height: 6),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 20,
                                  ),
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    color: PdfColor.fromHex('#f3e8d0'),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: email,
                                      //fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text("abc@xyz.com",
                                    style: TextStyle(fontSize: 9)),
                              ])
                        ]),
                  ]),
                ]),
                VerticalDivider(
                    thickness: 2,
                    color: PdfColors.black,
                    indent: 245,
                    endIndent: 60),
              ]));
        })); // Page
    //save PDF

    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/report.pdf';
    final File file = File(path);
    file.writeAsBytesSync(List.from(await pdf.save()));
    material.Navigator.of(context).push(
      material.MaterialPageRoute(
        builder: (_) => PdfViewerPage(path: path),
      ),
    );
  }
}
