import 'package:ufrb_eventos/app/modules/user_commands/infra/model/summary_model.dart';

abstract class IUserCommandsDatasource {
  Future<SummaryModel> createSummary(SummaryModel summaryModel);
}