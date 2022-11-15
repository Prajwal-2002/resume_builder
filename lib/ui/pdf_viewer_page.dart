import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:open_file_safe/open_file_safe.dart';

class PdfViewerPage {
  final String path;
  const PdfViewerPage({
    required this.path,
  });

  openfile() {
    OpenFile.open(path);
  }
}
