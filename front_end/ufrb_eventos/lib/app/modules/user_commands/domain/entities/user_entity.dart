import 'dart:convert';

import 'package:ufrb_eventos/app/modules/user_commands/domain/entities/inscription_entity.dart';
import 'package:ufrb_eventos/app/modules/user_commands/domain/entities/summary_entity.dart';
import 'package:ufrb_eventos/app/modules/user_commands/infra/model/summary_model.dart';

class UserEntity {
  int cpf;
  String name;
  String email;
  String password;
  bool loginState;
  var createDate;
  int accountIdentification;
  InscriptionEntity events;
  SummaryModel summaries;
  UserEntity({
    this.cpf,
    this.name,
    this.email,
    this.password,
    this.loginState,
    this.createDate,
    this.accountIdentification,
    this.events,
    this.summaries,
  });

  Map<String, dynamic> toMap() {
    return {
      'cpf': cpf,
      'name': name,
      'email': email,
      'password': password,
      'loginState': loginState,
      'createDate': createDate?.toMap(),
      'accountIdentification': accountIdentification,
      'events': events?.toMap(),
      'summaries': summaries?.toMap(),
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return UserEntity(
      cpf: map['cpf'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
      loginState: map['loginState'],
      createDate: map['createDate'],
      accountIdentification: map['accountIdentification'],
      events: InscriptionEntity.fromMap(map['events']),
      summaries: SummaryModel.fromMap(map['summaries']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) => UserEntity.fromMap(json.decode(source));
}
