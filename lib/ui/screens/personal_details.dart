import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_pdf/ui/controllers.dart';
import 'package:simple_pdf/ui/reuse_widgets.dart';

class PersonalDetails extends StatelessWidget {
  late List<Widget> personalDetails;
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
      ReuseWidgets.input_fields(
          _storeController.aboutController,
          "About*",
          "Enter about yourself briefly",
          TextInputAction.next,
          Icons.description),
      ReuseWidgets.input_fields(
          _storeController.gitHubController,
          "GitHub Username",
          "Enter GitHub username here",
          TextInputAction.next,
          Icons.person),
      ReuseWidgets.input_fields(
          _storeController.linkedInController,
          "LinkedIn Username",
          "Enter LinkedIn username here",
          TextInputAction.next,
          Icons.person),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ReuseWidgets.expansionTiles(
        "Personal Details", "Enter your personal details", personalDetails);
  }
}
