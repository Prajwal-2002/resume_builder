import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_pdf/ui/controllers.dart';
import 'package:simple_pdf/ui/reuse_widgets.dart';

class PersonalDetails extends StatelessWidget {
  late List<Widget> personalDetails;
  /*final _adressController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();*/
  final _storeController = Get.find<Controllers>();

  PersonalDetails({super.key}) {
    personalDetails = [
      ReuseWidgets.input_fields(_storeController.nameController, "Name*",
          "Enter name here", TextInputAction.next, Icons.person),
      ReuseWidgets.input_fields(_storeController.phoneController, "Phone*",
          "Enter phone here", TextInputAction.next, Icons.phone),
      ReuseWidgets.input_fields(_storeController.emailController, "Email*",
          "Enter email here", TextInputAction.next, Icons.email),
      ReuseWidgets.input_fields(_storeController.adressController, "Address*",
          "Enter address here", TextInputAction.next, Icons.location_on),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ReuseWidgets.expansionTiles(
        "Personal Details", "Enter your personal details", personalDetails);
  }
}
