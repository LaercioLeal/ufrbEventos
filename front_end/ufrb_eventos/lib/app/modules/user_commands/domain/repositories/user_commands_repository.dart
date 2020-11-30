import 'package:dartz/dartz.dart';
import 'package:ufrb_eventos/app/modules/user_commands/domain/entities/summary_entity.dart';
import 'package:ufrb_eventos/app/modules/user_commands/domain/errors/errors.dart';

abstract class IUserCommandsRepository {
  Future<Either<UserFailure, SummaryEntity>> createSummary(SummaryEntity summaryEntity);
}