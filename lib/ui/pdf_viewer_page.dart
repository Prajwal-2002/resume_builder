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
