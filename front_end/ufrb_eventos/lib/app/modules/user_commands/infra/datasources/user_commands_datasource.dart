import 'package:ufrb_eventos/app/modules/user_commands/domain/entities/summary_entity.dart';

abstract class IUserCommandsDatasource {
  Future<SummaryEntity> createSummary(SummaryEntity summaryEntity);
}