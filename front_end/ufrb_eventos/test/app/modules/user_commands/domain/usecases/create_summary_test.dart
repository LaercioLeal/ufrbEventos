import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ufrb_eventos/app/modules/user_commands/domain/entities/summary_entity.dart';
import 'package:ufrb_eventos/app/modules/user_commands/domain/errors/errors.dart';
import 'package:ufrb_eventos/app/modules/user_commands/domain/repositories/user_commands_repository.dart';
import 'package:ufrb_eventos/app/modules/user_commands/domain/usecases/create_summary.dart';
import 'package:ufrb_eventos/app/modules/user_commands/infra/model/summary_model.dart';

class UserCommandRepositoryMock extends Mock
    implements IUserCommandsRepository {}

main() {
  final repository = UserCommandRepositoryMock();
  final usecase = CreateSummary(repository);

  test('deve retornar um summary', () async {
    when(repository.createSummary(any))
        .thenAnswer((_) async => Right(SummaryModel()));
    final result = await usecase(SummaryModel());
    expect(result.fold(id, id), isA<SummaryEntity>());
  });

  test('deve retornar um NotValidParams', () async {
    when(repository.createSummary(any)).thenAnswer((_) async => Right(SummaryModel()));
    final result = await usecase(null);
    expect(result.fold(id, id), isA<NotValidParams>());
  });


}
