import 'package:flutter/material.dart';
import 'package:simple_pdf/input_field.dart';

class ReuseWidgets {
  static expansionTiles(String text, String subtitle, List<Widget> children) {
    return ExpansionTile(
      maintainState: true,
      title: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      initiallyExpanded: false,
      collapsedTextColor: Colors.white,
      textColor: Colors.black,
      childrenPadding: const EdgeInsets.only(
        top: 10,
      ),
      expandedAlignment: Alignment.center,
      iconColor: Colors.black87,
      subtitle: Text(subtitle),
      children: children,
      backgroundColor: Colors.white,
      collapsedBackgroundColor: const Color.fromARGB(255, 58, 58, 247),
    );
  }

  // ignore: non_constant_identifier_names
  static input_fields(TextEditingController ctr, String title, String hint,
      TextInputAction tia, IconData icon) {
    return MyInputField(title: title, hint: hint, tia: tia, icon: Icon(icon));
  }
}
