import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ufrb_eventos/app/modules/user_commands/domain/entities/summary_entity.dart';
import 'package:ufrb_eventos/app/modules/user_commands/domain/errors/errors.dart';
import 'package:ufrb_eventos/app/modules/user_commands/domain/repositories/user_commands_repository.dart';
import 'package:ufrb_eventos/app/modules/user_commands/infra/datasources/user_commands_datasource.dart';
import 'package:ufrb_eventos/app/modules/user_commands/infra/model/summary_model.dart';
import 'package:ufrb_eventos/app/modules/user_commands/infra/repositories/user_command_repository.dart';

class UserCommandDatasourceMock extends Mock
    implements IUserCommandsDatasource {}

main() {
  final datasource = UserCommandDatasourceMock();
  final repository = UserCommandsRepository(datasource);

  test('deve retornar um summary', () async {
    when(datasource.createSummary(any)).thenAnswer((_) async => SummaryModel());
    final result = await repository.createSummary(SummaryEntity());
    expect(result, isA<Right<dynamic, SummaryEntity>>());
  });

  test('deve retornar um NotValidParams', () async {
    when(repository.createSummary(any)).thenThrow(Exception());
    final result = await repository.createSummary(SummaryEntity());
    expect(result.fold(id, id), isA<NotValidParams>());
  });
}
