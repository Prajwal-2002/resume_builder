import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyInputField extends StatelessWidget {
  final String title, hint;
  final Icon icon;
  final TextEditingController ctr;
  final TextInputAction tia;
  const MyInputField({
    super.key,
    required this.title,
    required this.hint,
    required this.ctr,
    required this.tia,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final field = TextFormField(
      autofocus: false,
      controller: ctr,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("This field is required");
        }
        return null;
      },
      onChanged: (valve) {
        ctr.text = valve;
        print(ctr.text);
      },
      //cursorColor: Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
      //textInputAction: tia,
      decoration: InputDecoration(
        suffixIcon: icon,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black))),
          const SizedBox(
            height: 5,
          ),
          field,
        ],
      ),
    );
  }
}
