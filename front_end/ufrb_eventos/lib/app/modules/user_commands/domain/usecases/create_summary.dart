import 'package:dartz/dartz.dart';
import 'package:ufrb_eventos/app/modules/user_commands/domain/entities/summary_entity.dart';
import 'package:ufrb_eventos/app/modules/user_commands/domain/errors/errors.dart';
import 'package:ufrb_eventos/app/modules/user_commands/domain/repositories/user_commands_repository.dart';

abstract class ICreateSummary {
  Future<Either<UserFailure, SummaryEntity>> call(SummaryEntity summaryEntity);
}
class CreateSummary implements ICreateSummary {
  final IUserCommandsRepository repository;
  CreateSummary(this.repository);

  Future<Either<UserFailure, SummaryEntity>> call(SummaryEntity summaryEntity) async {
    
    if (summaryEntity == null) {
      return Left(NotValidParams('Parametros invalidos'));
    }
    
    return await repository.createSummary(summaryEntity);
  }
}