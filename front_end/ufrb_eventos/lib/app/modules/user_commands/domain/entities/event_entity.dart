import 'dart:convert';

import 'package:ufrb_eventos/app/modules/user_commands/domain/entities/user_entity.dart';

class EventEntity {
  int id;
  String eventName;
  UserEntity organizer;
  String speakers;
  String eventInstitution;
  var beginDate;
  var endDate;
  String description;
  String schedule;
  double worth;
  double workload;
  EventEntity({
    this.id,
    this.eventName,
    this.organizer,
    this.speakers,
    this.eventInstitution,
    this.beginDate,
    this.endDate,
    this.description,
    this.schedule,
    this.worth,
    this.workload,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'eventName': eventName,
      'organizer': organizer?.toMap(),
      'speakers': speakers,
      'eventInstitution': eventInstitution,
      'beginDate': beginDate?.toMap(),
      'endDate': endDate?.toMap(),
      'description': description,
      'schedule': schedule,
      'worth': worth,
      'workload': workload,
    };
  }

  factory EventEntity.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return EventEntity(
      id: map['id'],
      eventName: map['eventName'],
      organizer: UserEntity.fromMap(map['organizer']),
      speakers: map['speakers'],
      eventInstitution: map['eventInstitution'],
      beginDate: map['beginDate'],
      endDate: map['endDate'],
      description: map['description'],
      schedule: map['schedule'],
      worth: map['worth'],
      workload: map['workload'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EventEntity.fromJson(String source) => EventEntity.fromMap(json.decode(source));
}
