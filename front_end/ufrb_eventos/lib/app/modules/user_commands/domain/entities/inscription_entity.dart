import 'dart:convert';

import 'package:ufrb_eventos/app/modules/user_commands/domain/entities/event_entity.dart';
import 'package:ufrb_eventos/app/modules/user_commands/domain/entities/user_entity.dart';

class InscriptionEntity {
  int id;
  UserEntity user;
  EventEntity event;
  String userInstituition;
  String category;
  String participation;
  String phone;
  double userWorkload;
  InscriptionEntity({
    this.id,
    this.user,
    this.event,
    this.userInstituition,
    this.category,
    this.participation,
    this.phone,
    this.userWorkload,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user': user?.toMap(),
      'event': event?.toMap(),
      'userInstituition': userInstituition,
      'category': category,
      'participation': participation,
      'phone': phone,
      'userWorkload': userWorkload,
    };
  }

  factory InscriptionEntity.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return InscriptionEntity(
      id: map['id'],
      user: UserEntity.fromMap(map['user']),
      event: EventEntity.fromMap(map['event']),
      userInstituition: map['userInstituition'],
      category: map['category'],
      participation: map['participation'],
      phone: map['phone'],
      userWorkload: map['userWorkload'],
    );
  }

  String toJson() => json.encode(toMap());

  factory InscriptionEntity.fromJson(String source) => InscriptionEntity.fromMap(json.decode(source));
}
