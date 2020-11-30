
import 'user_entity.dart';

class SummaryEntity {
  int id;
  UserEntity user;
  String category;
  String participation;
  String phone;
  bool attendance;
  double userWorkload;
  SummaryEntity({
    this.id,
    this.user,
    this.category,
    this.participation,
    this.phone,
    this.attendance,
    this.userWorkload,
  });

  
}
