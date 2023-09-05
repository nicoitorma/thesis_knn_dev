class Skill {
  String title;
  String reference;
  List skill;

  Skill({required this.title, required this.reference, required this.skill});

  factory Skill.fromDocumentSnapshot(String title, List data) {
    return Skill(title: title, reference: data[0], skill: data);
  }
}
