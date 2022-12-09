import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controllers extends GetxController {
  final nameController = TextEditingController();
  final adressController = TextEditingController();
  final aboutController = TextEditingController();
  final gitHubController = TextEditingController();
  final linkedInController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final List<TextEditingController> yearActiveController =
      List<TextEditingController>.empty(growable: true);
  final List<TextEditingController> positionController =
      List<TextEditingController>.empty(growable: true);
  final List<TextEditingController> companyController =
      List<TextEditingController>.empty(growable: true);
  final List<TextEditingController> descriptionController =
      List<TextEditingController>.empty(growable: true);
  final cgpaController = TextEditingController();
  final schoolController = TextEditingController();
  final courseController = TextEditingController();
  final yearController = TextEditingController();
  final skillController = TextEditingController();
  final List<TextEditingController> projNameController =
      List<TextEditingController>.empty(growable: true);
  final List<TextEditingController> projDescriptionController =
      List<TextEditingController>.empty(growable: true);
  final List<TextEditingController> titleController =
      List<TextEditingController>.empty(growable: true);
  final List<TextEditingController> descController =
      List<TextEditingController>.empty(growable: true);
}
