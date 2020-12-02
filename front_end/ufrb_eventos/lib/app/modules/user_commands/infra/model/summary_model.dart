import 'dart:convert';

import 'package:ufrb_eventos/app/modules/user_commands/domain/entities/summary_entity.dart';

class SummaryModel extends SummaryEntity {
  SummaryModel({int inscriptionId, int enrollment, String userInstitution, String title, String description, String summary, String video, String response, String observation}) : super(inscriptionId, enrollment, userInstitution, title, description, summary, video, response, observation);
  

  Map<String, dynamic> toMap() {
    return {
      'inscriptionId': inscriptionId,
      'enrollment': enrollment,
      'userInstitution': userInstitution,
      'title': title,
      'description': description,
      'summary': summary,
      'video': video,
      'response': response,
      'observation': observation,
    };
  }

  factory SummaryModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return SummaryModel(
      inscriptionId: map['inscriptionId'],
      enrollment: map['enrollment'],
      userInstitution: map['userInstitution'],
      title: map['title'],
      description: map['description'],
      summary: map['summary'],
      video: map['video'],
      response: map['response'],
      observation: map['observation'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SummaryModel.fromJson(String source) => SummaryModel.fromMap(json.decode(source));
  

}
