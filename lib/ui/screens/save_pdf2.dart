import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:simple_pdf/model/pdf_data.dart';
import 'package:simple_pdf/ui/pdf_viewer_page.dart';

class SavePdf2 {
  static void savePdf(PdfDataModel pdfData) async {
    final Document pdf = Document();

    final telephone = MemoryImage(
        (await rootBundle.load('assets/icon/telephone.png'))
            .buffer
            .asUint8List());
    final email = MemoryImage(
        (await rootBundle.load('assets/icon/email.png')).buffer.asUint8List());
    final github = MemoryImage(
        (await rootBundle.load('assets/icon/github.png')).buffer.asUint8List());
    final linkedin = MemoryImage(
        (await rootBundle.load('assets/icon/linkedin.png'))
            .buffer
            .asUint8List());

    pdf.addPage(Page(
        pageFormat: PdfPageFormat.a4,
        build: (Context context) {
          return Column(mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    height: 80,
                    width: double.infinity,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(pdfData.name,
                              style: TextStyle(
                                  fontBold: Font.courierBoldOblique(),
                                  fontSize: 18,
                                  color: PdfColors.white)),
                          Row(children: [
                            Spacer(flex: 3),
                            //Icon(IconData(0xe530)),
                            Container(
                                width: 15,
                                height: 12,
                                decoration: BoxDecoration(
                                    color: PdfColors.white,
                                    image: DecorationImage(
                                        image: email, fit: BoxFit.fill),
                                    shape: BoxShape.rectangle,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(3.0)))),
                            SizedBox(width: 5),
                            //Image(email),
                            Text(pdfData.email,
                                style: const TextStyle(color: PdfColors.white)),
                            //SizedBox(width: 15),
                            Spacer(),
                            Container(
                                width: 15,
                                height: 12,
                                decoration: BoxDecoration(
                                    color: PdfColors.white,
                                    image: DecorationImage(
                                        image: telephone, fit: BoxFit.contain),
                                    shape: BoxShape.rectangle,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(3.0)))),
                            SizedBox(width: 5),
                            //Image(email),
                            Text(pdfData.phone,
                                style: const TextStyle(color: PdfColors.white)),
                            Spacer(),
                            Container(
                                width: 15,
                                height: 12,
                                decoration: BoxDecoration(
                                    color: PdfColors.white,
                                    image: DecorationImage(
                                        image: github, fit: BoxFit.contain),
                                    shape: BoxShape.rectangle,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(3.0)))),
                            SizedBox(width: 5),
                            //Image(email),
                            Text(pdfData.github,
                                style: const TextStyle(color: PdfColors.white)),
                            Spacer(),
                            Container(
                                width: 15,
                                height: 12,
                                decoration: BoxDecoration(
                                    color: PdfColors.white,
                                    image: DecorationImage(
                                        image: linkedin, fit: BoxFit.contain),
                                    shape: BoxShape.rectangle,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(3.0)))),
                            SizedBox(width: 5),
                            //Image(email),
                            Text(pdfData.linkedin,
                                style: const TextStyle(color: PdfColors.white)),
                            Spacer(flex: 3)
                          ])
                        ]),
                    decoration: const BoxDecoration(
                      color: PdfColors.indigo600,
                      shape: BoxShape.rectangle,
                    )),
                Spacer(),
                _headingBox("Profile"),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    //color: PdfColors.blueGrey100,
                    child: Text(pdfData.about,
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            font: Font.times()))),
                Spacer(),
                _headingBox("Professional Experience"),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    //color: PdfColors.blueGrey100,
                    child: Column(children: [
                      Row(children: [
                        Text(pdfData.experience[0].position,
                            style: TextStyle(
                                font: Font.timesBold(),
                                fontWeight: FontWeight.bold)),
                        Text(pdfData.experience[0].company,
                            style: TextStyle(font: Font.timesItalic())),
                        Spacer(),
                        Text(pdfData.experience[0].duration)
                      ]),
                      SizedBox(height: 6),
                      Row(children: [
                        Text("Flutter Developer, ",
                            style: TextStyle(
                                font: Font.timesBold(),
                                fontWeight: FontWeight.bold)),
                        Text("Abhishek Freelancing Agency",
                            style: TextStyle(font: Font.timesItalic())),
                        Spacer(),
                        Text("present")
                      ]),
                      SizedBox(height: 6),
                      Row(children: [
                        Text("My Flutter Youtube channel, ",
                            style: TextStyle(
                                font: Font.timesBold(),
                                fontWeight: FontWeight.bold)),
                        Text("code a startup",
                            style: TextStyle(font: Font.timesItalic())),
                        Spacer(),
                        Text("present")
                      ]),
                      SizedBox(height: 6),
                      Row(children: [
                        Text("My Startup : Yozznet, ",
                            style: TextStyle(
                                font: Font.timesBold(),
                                fontWeight: FontWeight.bold)),
                        Text(
                            "flutter app for college students(social media app)",
                            style: TextStyle(font: Font.timesItalic())),
                        Spacer(),
                      ]),
                    ])),
                Spacer(),
                _headingBox("Skills"),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    //color: PdfColors.blueGrey100,
                    child: Column(children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      alignment: Alignment.centerLeft,
                                      height: 14,
                                      padding: const EdgeInsets.only(
                                          top: 1.6, bottom: 1.6),
                                      child: Text("Flutter",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              font: Font.timesBold()))),
                                  Container(
                                      width: 200,
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.only(
                                          top: 3, bottom: 3),
                                      //color: PdfColors.blueGrey100,
                                      child: Text(
                                          "2.5+ years exp in coding apps with Flutter , +Points: state management-Getx and provider,MVC pattern, systematic coding",
                                          maxLines: 3,
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              font: Font.times()))),
                                ]),
                            Spacer(),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      alignment: Alignment.center,
                                      height: 14,
                                      padding: const EdgeInsets.only(
                                          top: 1.6, bottom: 1.6),
                                      child: Text("Backend",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              font: Font.timesBold()))),
                                  Container(
                                      width: 180,
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.only(
                                          top: 3, bottom: 3),
                                      //color: PdfColors.blueGrey100,
                                      child: Text(
                                          "${pdfData.skills[0]}, ${pdfData.skills[1]}, ${pdfData.skills[2]}, ${pdfData.skills[3]}, ${pdfData.skills[4]}",
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              font: Font.times()))),
                                ]),
                          ]),
                      SizedBox(height: 7),
                      Row(children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  height: 14,
                                  padding: const EdgeInsets.only(
                                      top: 1.6, bottom: 1.6),
                                  child: Text("Languages",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          font: Font.timesBold()))),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  padding:
                                      const EdgeInsets.only(top: 3, bottom: 3),
                                  //color: PdfColors.blueGrey100,
                                  child: Text("Dart,Java,JavaScript,Python",
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          font: Font.times()))),
                            ]),
                        Spacer(),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  height: 14,
                                  padding: const EdgeInsets.only(
                                      top: 1.6, bottom: 1.6),
                                  child: Text("Tools",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          font: Font.timesBold()))),
                              Container(
                                  width: 180,
                                  alignment: Alignment.centerLeft,
                                  padding:
                                      const EdgeInsets.only(top: 3, bottom: 3),
                                  //color: PdfColors.blueGrey100,
                                  child: Text("Git, VSCode, Notion, Clickup",
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          font: Font.times()))),
                            ]),
                      ]),
                    ])),
                Spacer(),
                _headingBox("Projects"),
                Container(
                    width: 450,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                    ),
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(alignment: WrapAlignment.start, children: [
                            RichText(
                              maxLines: 2,
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "${pdfData.projects[0].projName}  : ",
                                    style: TextStyle(
                                        font: Font.timesBold(),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                      text: pdfData.projects[0].projDescription,
                                      style:
                                          TextStyle(font: Font.timesItalic())),
                                ],
                              ),
                            ),
                          ]),
                          SizedBox(height: 6),
                          Wrap(alignment: WrapAlignment.start, children: [
                            RichText(
                              maxLines: 2,
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Yozznet (available on playstore), ',
                                    style: TextStyle(
                                        font: Font.timesBold(),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                      text: 'an app for all  your needs!',
                                      style:
                                          TextStyle(font: Font.timesItalic())),
                                ],
                              ),
                            ),
                          ]),
                          SizedBox(height: 6),
                          Wrap(alignment: WrapAlignment.start, children: [
                            RichText(
                              maxLines: 2,
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        'KnowYourGhats - Smart India Hackathon 2020 winning app, ',
                                    style: TextStyle(
                                        font: Font.timesBold(),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                      text:
                                          'App to know Ghats loaction. Used google maps api',
                                      style:
                                          TextStyle(font: Font.timesItalic())),
                                ],
                              ),
                            ),
                          ]),
                          SizedBox(height: 6),
                          Wrap(alignment: WrapAlignment.start, children: [
                            RichText(
                              maxLines: 2,
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        'Commentator App :- Made as a freelancing job, ',
                                    style: TextStyle(
                                        font: Font.timesBold(),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                      text:
                                          'Full social media app with firebase and firestore. Feature-stories, likes, comment, follow etc.',
                                      style:
                                          TextStyle(font: Font.timesItalic())),
                                ],
                              ),
                            ),
                          ]),
                          SizedBox(height: 6),
                          Wrap(alignment: WrapAlignment.start, children: [
                            RichText(
                              maxLines: 2,
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        'KishanSeva app - made during smit hackathon, ',
                                    style: TextStyle(
                                        font: Font.timesBold(),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                      text:
                                          'Features-rent tools, sell products online',
                                      style:
                                          TextStyle(font: Font.timesItalic())),
                                ],
                              ),
                            ),
                          ]),
                          SizedBox(height: 6),
                          Wrap(alignment: WrapAlignment.start, children: [
                            RichText(
                              maxLines: 2,
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Helping hands App, ',
                                    style: TextStyle(
                                        font: Font.timesBold(),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                      text: 'made during HackJaipur hackathon',
                                      style:
                                          TextStyle(font: Font.timesItalic())),
                                ],
                              ),
                            ),
                          ]),
                        ])),
                Spacer(),
                _headingBox("Awards"),
                Container(
                    width: 450,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                    ),
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(alignment: WrapAlignment.start, children: [
                            RichText(
                              maxLines: 2,
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '${pdfData.awards[0].title}, ',
                                    style: TextStyle(
                                        font: Font.timesBold(),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                      text: pdfData.awards[0].desc,
                                      style:
                                          TextStyle(font: Font.timesItalic())),
                                ],
                              ),
                            ),
                          ]),
                          SizedBox(height: 6),
                          Wrap(alignment: WrapAlignment.start, children: [
                            RichText(
                              maxLines: 2,
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        'Top 10 in 1 Million second Hackathon, ',
                                    style: TextStyle(
                                        font: Font.timesBold(),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                      text: 'by TISC and publishsutra',
                                      style:
                                          TextStyle(font: Font.timesItalic())),
                                ],
                              ),
                            ),
                          ]),
                          SizedBox(height: 6),
                          Wrap(alignment: WrapAlignment.start, children: [
                            RichText(
                              maxLines: 2,
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        'B-Plan winner for my startup idea Yozznet, ',
                                    style: TextStyle(
                                        font: Font.timesBold(),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                      text:
                                          'by RIT bangalore(inter-college b-plan competition)',
                                      style:
                                          TextStyle(font: Font.timesItalic())),
                                ],
                              ),
                            ),
                          ]),
                        ])),
                Spacer(),
                _headingBox('Education'),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    //color: PdfColors.blueGrey100,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 320,
                                  child: RichText(
                                    maxLines: 2,
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Bachelor of Engineering, ',
                                          style: TextStyle(
                                              font: Font.timesBold(),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                            text:
                                                'Ramaiah Institute of Technology Information Science',
                                            style: TextStyle(
                                                font: Font.timesItalic())),
                                      ],
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Text("Bangalore"),
                              ]),
                        ])),
              ]);
        }));
    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/report.pdf';
    final File file = File(path);
    file.writeAsBytesSync(List.from(await pdf.save()));
    /*material.Navigator.of(context).push(
      material.MaterialPageRoute(
        builder: (_) => PdfViewerPage(path: path),
      ),
    );*/
    PdfViewerPage(path: path).openfile();
  }

  static _headingBox(String text) {
    return Container(
        alignment: Alignment.center,
        height: 18,
        padding: const EdgeInsets.only(top: 1.6, bottom: 1.6),
        margin: const EdgeInsets.only(left: 15, right: 15),
        color: PdfColors.blueGrey100,
        child: Text(text,
            style: TextStyle(
                fontWeight: FontWeight.bold, font: Font.timesBold())));
  }
}
