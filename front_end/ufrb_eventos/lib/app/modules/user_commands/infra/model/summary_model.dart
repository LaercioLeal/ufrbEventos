import 'dart:convert';
import 'package:ufrb_eventos/app/modules/user_commands/domain/entities/summary_entity.dart';
import 'package:ufrb_eventos/app/modules/user_commands/domain/entities/user_entity.dart';

class SummaryModel extends SummaryEntity {
  SummaryModel({int id, UserEntity user, String category, String participation, String phone, bool attendance, double userWorkload}) : super(id: id, user: user, category: category, participation: participation, phone: phone, attendance: attendance, userWorkload: userWorkload);
  
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user': user?.toMap(),
      'category': category,
      'participation': participation,
      'phone': phone,
      'attendance': attendance,
      'userWorkload': userWorkload,
    };
  }

  factory SummaryModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return SummaryModel(
      id: map['id'],
      user: UserEntity.fromMap(map['user']),
      category: map['category'],
      participation: map['participation'],
      phone: map['phone'],
      attendance: map['attendance'],
      userWorkload: map['userWorkload'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SummaryModel.fromJson(String source) => SummaryModel.fromMap(json.decode(source));
}