
import 'user_entity.dart';

class SummaryEntity {
  int inscriptionId;
  UserEntity user;
  String enrollment;
  String userInstitution;
  String description;
  String summary;
  String video;
  String category;
  String participation;
  String phone;
  bool attendance;
  double userWorkload;
  SummaryEntity(
    this.inscriptionId,
    this.user,
    this.enrollment,
    this.userInstitution,
    this.description,
    this.summary,
    this.video,
    this.category,
    this.participation,
    this.phone,
    this.attendance,
    this.userWorkload,
  );

  

}
