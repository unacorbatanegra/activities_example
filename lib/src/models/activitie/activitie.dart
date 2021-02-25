import '../models.dart';

class Activitie {
  String uuid;
  String name;
  String description;
  User organization;
  DateTime date;
  List<String> activities;

  Activitie({
    this.uuid,
    this.date,
    this.description,
    this.name,
    this.organization,
    this.activities,
  });

  Map<String, dynamic> toJson() => {
        'date': date?.millisecondsSinceEpoch,
        'name': name,
        'uuid': uuid,
        'description': description,
        'organization': organization.toJson(),
        'activities': activities,
        'searchName': name.toLowerCase(),
      };

  factory Activitie.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Activitie(
      date: DateTime.fromMillisecondsSinceEpoch(json['date'] as int),
      name: json['name'] as String,
      uuid: json['uuid'] as String,
      description: json['description'] as String,
      organization: User.fromJsonOrg(
        json['organization'] as Map<String, dynamic>,
      ),
      activities: List<String>.from(json['activities'] as Iterable),
    );
  }
}
