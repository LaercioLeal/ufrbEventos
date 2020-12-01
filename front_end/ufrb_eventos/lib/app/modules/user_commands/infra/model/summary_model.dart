import 'dart:convert';
import 'package:ufrb_eventos/app/modules/user_commands/domain/entities/summary_entity.dart';
import 'package:ufrb_eventos/app/modules/user_commands/domain/entities/user_entity.dart';

class SummaryModel extends SummaryEntity {
  SummaryModel({int inscriptionId, UserEntity user, String enrollment, String userInstitution, String description, String summary, String video, String category, String participation, String phone, bool attendance, double userWorkload}) : super(inscriptionId, user, enrollment, userInstitution, description, summary, video, category, participation, phone, attendance, userWorkload);
  

  Map<String, dynamic> toMap() {
    return {
      'inscriptionId': inscriptionId,
      'user': user?.toMap(),
      'enrollment': enrollment,
      'userInstitution': userInstitution,
      'description': description,
      'summary': summary,
      'video': video,
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
      inscriptionId: map['inscriptionId'],
      user: UserEntity.fromMap(map['user']),
      enrollment: map['enrollment'],
      userInstitution: map['userInstitution'],
      description: map['description'],
      summary: map['summary'],
      video: map['video'],
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