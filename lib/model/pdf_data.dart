class PdfData {
  final String name;
  final String college;
  final String email;
  final String phone;
  final String address;
  final List<Education> education;

  PdfData(
      {required this.name,
      required this.college,
      required this.email,
      required this.phone,
      required this.address,
      required this.education});
}

class Education {
  final String course;
  final String school;
  final String cgpa;
  final int year;

  Education(
      {required this.course,
      required this.school,
      required this.cgpa,
      required this.year});
}
