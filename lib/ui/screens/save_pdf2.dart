import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:flutter/material.dart' as mt;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:simple_pdf/model/pdf_data.dart';
import 'package:simple_pdf/ui/pdf_viewer_page.dart';

class SavePdf2 {
  static void savePdf(PdfData pdfData) async {
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
                    height: 120,
                    width: double.infinity,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Satyam Kumar",
                              style: TextStyle(
                                  fontBold: Font.courierBoldOblique(),
                                  fontSize: 20,
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
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(3.0)))),
                            SizedBox(width: 5),
                            //Image(email),
                            Text("satyamkumar@gmail.com",
                                style: TextStyle(color: PdfColors.white)),
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
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(3.0)))),
                            SizedBox(width: 5),
                            //Image(email),
                            Text("7090615615",
                                style: TextStyle(color: PdfColors.white)),
                            Spacer(),
                            Container(
                                width: 15,
                                height: 12,
                                decoration: BoxDecoration(
                                    color: PdfColors.white,
                                    image: DecorationImage(
                                        image: github, fit: BoxFit.contain),
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(3.0)))),
                            SizedBox(width: 5),
                            //Image(email),
                            Text("Satyamkr07",
                                style: TextStyle(color: PdfColors.white)),
                            Spacer(),
                            Container(
                                width: 15,
                                height: 12,
                                decoration: BoxDecoration(
                                    color: PdfColors.white,
                                    image: DecorationImage(
                                        image: linkedin, fit: BoxFit.contain),
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(3.0)))),
                            SizedBox(width: 5),
                            //Image(email),
                            Text("Satyam",
                                style: TextStyle(color: PdfColors.white)),
                            Spacer(flex: 3)
                          ])
                        ]),
                    decoration: BoxDecoration(
                      color: PdfColors.indigo700,
                      shape: BoxShape.rectangle,
                    )),
                Spacer(),
                Container(
                    alignment: Alignment.center,
                    height: 20,
                    padding: EdgeInsets.only(top: 1.7, bottom: 1.7),
                    margin: EdgeInsets.only(left: 15, right: 15),
                    color: PdfColors.blueGrey100,
                    child: Text("Profile",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            font: Font.timesBold()))),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    margin: EdgeInsets.only(left: 15, right: 15),
                    //color: PdfColors.blueGrey100,
                    child: Text(
                        "Enthusiastic Flutter Developer with a passion to solve real life problems using mobile apps.(2 apps on Playstore)",
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            font: Font.times()))),
                Spacer(),
                Container(
                    alignment: Alignment.center,
                    height: 20,
                    padding: EdgeInsets.only(top: 1.7, bottom: 1.7),
                    margin: EdgeInsets.only(left: 15, right: 15),
                    color: PdfColors.blueGrey100,
                    child: Text("Professional Experience",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            font: Font.timesBold()))),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    margin: EdgeInsets.only(left: 15, right: 15),
                    //color: PdfColors.blueGrey100,
                    child: Column(children: [
                      Row(children: [
                        Text("Flutter Developer, ",
                            style: TextStyle(
                                font: Font.timesBold(),
                                fontWeight: FontWeight.bold)),
                        Text("Rapidalley",
                            style: TextStyle(font: Font.timesItalic())),
                        Spacer(),
                        Text("2020")
                      ]),
                      SizedBox(height: 8),
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
                      SizedBox(height: 8),
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
                      SizedBox(height: 8),
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
                      SizedBox(height: 8),
                    ])),
                Spacer(),
                Container(
                    alignment: Alignment.center,
                    height: 20,
                    padding: EdgeInsets.only(top: 1.7, bottom: 1.7),
                    margin: EdgeInsets.only(left: 15, right: 15),
                    color: PdfColors.blueGrey100,
                    child: Text("Skills",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            font: Font.timesBold()))),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    margin: EdgeInsets.only(left: 15, right: 15),
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
                                      height: 16,
                                      padding: EdgeInsets.only(
                                          top: 1.7, bottom: 1.7),
                                      child: Text("Flutter",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              font: Font.timesBold()))),
                                  Container(
                                      width: 200,
                                      alignment: Alignment.centerLeft,
                                      padding:
                                          EdgeInsets.only(top: 3, bottom: 3),
                                      //color: PdfColors.blueGrey100,
                                      child: Text(
                                          "2.5+ years exp in coding apps with Flutter , +Points: state management-Getx and provider,MVC pattern, systematic coding",
                                          maxLines: 4,
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
                                      height: 16,
                                      padding: EdgeInsets.only(
                                          top: 1.7, bottom: 1.7),
                                      child: Text("Backend",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              font: Font.timesBold()))),
                                  Container(
                                      width: 200,
                                      alignment: Alignment.centerLeft,
                                      padding:
                                          EdgeInsets.only(top: 3, bottom: 3),
                                      //color: PdfColors.blueGrey100,
                                      child: Text(
                                          "Node.js with MongoDB, REST API, FireBase, FireStore, FCM Notifications",
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              font: Font.times()))),
                                ]),
                          ]),
                      SizedBox(height: 10),
                      Row(children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  height: 16,
                                  padding:
                                      EdgeInsets.only(top: 1.7, bottom: 1.7),
                                  child: Text("Languages",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          font: Font.timesBold()))),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(top: 3, bottom: 3),
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
                                  height: 16,
                                  padding:
                                      EdgeInsets.only(top: 1.7, bottom: 1.7),
                                  child: Text("Tools",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          font: Font.timesBold()))),
                              Container(
                                  width: 200,
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(top: 3, bottom: 3),
                                  //color: PdfColors.blueGrey100,
                                  child: Text("Git, VSCode, Notion, Clickup",
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          font: Font.times()))),
                            ]),
                      ]),
                      SizedBox(height: 8),
                    ])),
                Spacer(),
                Container(
                    alignment: Alignment.center,
                    height: 20,
                    padding: EdgeInsets.only(top: 1.7, bottom: 1.7),
                    margin: EdgeInsets.only(left: 15, right: 15),
                    color: PdfColors.blueGrey100,
                    child: Text("Projects",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            font: Font.timesBold()))),
                Wrap(),
                Container(
                    width: 450,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                    ),
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RichText(
                              maxLines: 2,
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        'Dear Shayari App(available on playstore), ',
                                    style: TextStyle(
                                        font: Font.timesBold(),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                      text:
                                          'App with Beautiful UI, Features-create shayari, change bg pic (unsplash api used), share on WhatsApp etc.',
                                      style:
                                          TextStyle(font: Font.timesItalic())),
                                ],
                              ),
                            ),
                            /*Text("Dear Shayari App(available on playstore), ",
                                style: TextStyle(
                                    font: Font.timesBold(),
                                    fontWeight: FontWeight.bold)),
                            Text(
                                "App with Beautiful UI, Features-create shayari, change bg pic (unsplash api used), share on WhatsApp etc.",
                                maxLines: 2,
                                textAlign: TextAlign.justify,
                                style: TextStyle(font: Font.timesItalic())),*/
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
}
