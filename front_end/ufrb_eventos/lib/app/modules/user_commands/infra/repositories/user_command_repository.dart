import 'package:ufrb_eventos/app/modules/user_commands/domain/errors/errors.dart';
import 'package:ufrb_eventos/app/modules/user_commands/domain/entities/summary_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:ufrb_eventos/app/modules/user_commands/domain/repositories/user_commands_repository.dart';
import 'package:ufrb_eventos/app/modules/user_commands/infra/datasources/user_commands_datasource.dart';
import 'package:ufrb_eventos/app/modules/user_commands/infra/model/summary_model.dart';

class UserCommandsRepository implements IUserCommandsRepository {
  final IUserCommandsDatasource datasource;

  UserCommandsRepository(this.datasource);
  @override
  Future<Either<UserFailure, SummaryEntity>> createSummary(
      SummaryEntity summaryEntity) async {
    SummaryModel model;
    try {
      model = await datasource.createSummary(summaryEntity);
    } catch (e) {
      return Left(NotValidParams('Error: ${e.message}'));
    }
    return Right(model);
  }
}
