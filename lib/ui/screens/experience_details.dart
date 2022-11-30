import 'package:flutter/material.dart';
import 'package:simple_pdf/ui/reuse_widgets.dart';

class ExperienceDetails extends StatelessWidget {
  late List<Widget> experienceDetails;

  final _yearActiveController = TextEditingController();
  final _positionController = TextEditingController();
  final _companyController = TextEditingController();
  final _descriptionController = TextEditingController();

  ExperienceDetails({super.key}) {
    experienceDetails = [
      ReuseWidgets.input_fields(_yearActiveController, "Year Active",
          "Enter year active here", TextInputAction.next, Icons.calendar_month),
      ReuseWidgets.input_fields(_positionController, "Position",
          "Enter position here", TextInputAction.next, Icons.work),
      ReuseWidgets.input_fields(_companyController, "Company",
          "Enter company here", TextInputAction.next, Icons.business),
      ReuseWidgets.input_fields(_descriptionController, "Description",
          "Enter description here", TextInputAction.next, Icons.description),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ReuseWidgets.expansionTiles(
        "Experience", "Enter Experience Details", experienceDetails);
  }
}
