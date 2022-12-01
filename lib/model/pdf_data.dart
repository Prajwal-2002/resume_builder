class PdfData {
  static late String name;
  static late String college;
  static late String email;
  static late String phone;
  static late String address;
  static List<Education> education = [];
  static List<Experience> experience = [];
  static List<Award> awards = [];
  static List<Project> projects = [];
  static List<String> skills = [];
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

class Experience {
  final String company;
  final String position;
  final String duration;
  final String description;

  Experience(
      {required this.company,
      required this.position,
      required this.duration,
      required this.description});
}

class Project {
  final String projName;
  final String projDescription;

  Project({required this.projName, required this.projDescription});
}

class Award {
  final String title;
  final String desc;

  Award({required this.title, required this.desc});
}
