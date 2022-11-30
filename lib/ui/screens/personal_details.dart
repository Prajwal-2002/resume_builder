import 'package:flutter/material.dart';
import 'package:simple_pdf/ui/reuse_widgets.dart';

class PersonalDetails extends StatelessWidget {
  late List<Widget> personalDetails;

  final _adressController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  PersonalDetails({super.key}) {
    personalDetails = [
      ReuseWidgets.input_fields(_nameController, "Name*", "Enter name here",
          TextInputAction.next, Icons.person),
      ReuseWidgets.input_fields(_phoneController, "Phone*", "Enter phone here",
          TextInputAction.next, Icons.phone),
      ReuseWidgets.input_fields(_emailController, "Email*", "Enter email here",
          TextInputAction.next, Icons.email),
      ReuseWidgets.input_fields(_adressController, "Address*",
          "Enter address here", TextInputAction.next, Icons.location_on),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ReuseWidgets.expansionTiles(
        "Personal Details", "Enter your personal details", personalDetails);
  }
}
