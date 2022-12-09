class PdfData {
  static List<Education> education = List<Education>.empty(growable: true);
  static List<Experience> experience = List<Experience>.empty(growable: true);
  static List<Award> awards = List<Award>.empty(growable: true);
  static List<Project> projects = List<Project>.empty(growable: true);
  static List<String> skills = List<String>.empty(growable: true);
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
  late final String projName;
  late final String projDescription;

  Project({required this.projName, required this.projDescription});
}

class Award {
  final String title;
  final String desc;

  Award({required this.title, required this.desc});
}

class PdfDataModel {
  final String name;
  final String phone;
  final String email;
  final String address;
  final String about;
  final String linkedin;
  final String github;
  final List<Education> education;
  final List<Experience> experience;
  final List<Award> awards;
  final List<Project> projects;
  final List<String> skills;

  PdfDataModel(
      {required this.name,
      required this.phone,
      required this.email,
      required this.address,
      required this.about,
      required this.linkedin,
      required this.github,
      required this.education,
      required this.experience,
      required this.awards,
      required this.projects,
      required this.skills});
}
